//
//  ImageDownloader.swift
//  MentorshipMarch2022
//
//  Created by Matt Bowen on 3/23/22.
//

import Foundation
import UIKit

class ImageDownloader {
  private let url: URL
  
  init(urlString: String) {
    self.url = URL(string: urlString)!
  }
  
  func downloadImage(completionHandler: @escaping (UIImage?) -> Void) {
    let session = URLSession(configuration: .default)
    let sessionDataTask = session.dataTask(with: url) { data, response, error in
      if let error = error {
        print(">>>>> Error getting image \(error)")
      }
      
      if let data = data {
        guard let image = UIImage(data: data) else {
          print("Error getting image from data")
          return
        }
        
        completionHandler(image)
        return
      }
    }
    
    sessionDataTask.resume()
  }
}
