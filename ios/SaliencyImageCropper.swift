//
//  SaliencyImageCropper.swift
//  MentorshipMarch2022
//
//  Created by Matt Bowen on 3/16/22.
//

import Foundation
import Vision

class SaliencyImageCropper {
  private let workQueue = DispatchQueue(label: "VisionRequest", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
  private let saliencyRequest = VNGenerateAttentionBasedSaliencyImageRequest(completionHandler: nil)
  
  func processImage(_ image: UIImage, completionHandler: @escaping (UIImage?) -> Void) {
    
    guard let originalImage = image.cgImage else { return }
    
    let requestHandler = VNImageRequestHandler(cgImage: originalImage, options: [:])
    do {
      try requestHandler.perform([self.saliencyRequest])
      guard let results = self.saliencyRequest.results?.first else{ return }
      
      if let observation = results as? VNSaliencyImageObservation
      {
        var unionOfSalientRegions = CGRect(x: 0, y: 0, width: 0, height: 0)
        let salientObjects = observation.salientObjects
        
        for salientObject in salientObjects ?? [] {
          unionOfSalientRegions = unionOfSalientRegions.union(salientObject.boundingBox)
        }
        
        if let ciimage = CIImage(image: image)
        {
          let salientRect = VNImageRectForNormalizedRect(unionOfSalientRegions,
                                                         Int(ciimage.extent.size.width),
                                                         Int(ciimage.extent.size.height))
          let croppedImage = ciimage.cropped(to: salientRect)
          let thumbnail =  UIImage(ciImage:croppedImage)
          DispatchQueue.main.async {
            completionHandler(thumbnail)
          }
        }
      }
      
    } catch {
      print(error)
    }
  }
}
