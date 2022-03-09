//
//  LoggingModule.swift
//  MentorshipMarch2022
//
//  Created by Matt Bowen on 3/9/22.
//

import Foundation

@objc(NativeModule)
class NativeModule: NSObject, RCTBridgeModule {
  static func moduleName() -> String! {
    return "NativeModule"
  }
  
  @objc func log(_ level: String, message: String) {
    print(">>>>> From RN \(message)")
  }
  
  @objc func sumTwoNumbers(_ a: NSNumber, b: NSNumber) {
    print(Int(a) + Int(b))
  }
}
