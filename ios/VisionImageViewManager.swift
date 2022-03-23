//
//  VisionImageViewManager.swift
//  MentorshipMarch2022
//
//  Created by Matt Bowen on 3/9/22.
//

import Foundation
import React

@objc(VisionImageViewManager)
class VisionImageViewManager: RCTViewManager {
  override class func moduleName() -> String! {
    return "VisionImageView"
  }
  
  override func view() -> UIView! {
    return VisionImageView(frame: .zero)
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

class VisionImageView: UIImageView {
  @objc
  var imageMode: String? {
    didSet {
      switch imageMode {
      case "scaleAspectFill":
        self.contentMode = .scaleAspectFill
      case "scaleAspectFit":
        self.contentMode = .scaleAspectFit
      case "scaleToFill":
        self.contentMode = .scaleToFill
      default:
        self.contentMode = .scaleToFill
      }
    }
  }
  
  @objc var cropForSaliency: Bool = false {
    didSet {
      if cropForSaliency {
        image = salientImage
      } else {
        image = UIImage(named: "penguin")
      }
    }
  }
  
  @objc var imageSource: String? = nil {
    didSet {
      guard let imageSource = imageSource else {
        return
      }
      
      let downloadTask = ImageDownloader(urlString: imageSource)
      downloadTask.downloadImage { [weak self] newImage in
        DispatchQueue.main.async {
          self?.image = newImage
        }
      }
    }
  }
  
  private var salientImage: UIImage? = nil {
    didSet {
      if cropForSaliency {
        image = salientImage
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    let image = UIImage(named: "penguin")!
    let imageCropper = SaliencyImageCropper()
    self.image = image
    self.clipsToBounds = true
    imageCropper.processImage(image) { [weak self] newImage in
      self?.salientImage = newImage
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
