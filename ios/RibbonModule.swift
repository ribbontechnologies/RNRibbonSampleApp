import Foundation
import AVFoundation
import RibbonKit
import OSLog


@objc(RibbonModule)
class RibbonModule: NSObject {
  

  @objc
  func configure(_ ribbonId: String) {
    Ribbon.shared.configure(withID: ribbonId)
  }
  
  @objc(trigger:resolver:rejecter:)
  func trigger(_ someValue: String,
               resolver resolve: @escaping RCTPromiseResolveBlock,
               rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    Ribbon.shared.trigger(someValue) { state in
      print(state)
      switch state {
      case .noStudy:
        resolve("NoReady")
      case .ready:
        resolve("StudyReady")
      case .error(let error):
        reject("Error", "Failure", error)
      @unknown default:
        print("some other case")
      }
    }
  }
  
  @objc
  func triggerAndShow(trigger: String) {
    Ribbon.shared.triggerAndShow(trigger)
  }
  
  @objc
  func showDialog() {
    Ribbon.shared.show()
  }
  
  @objc(getAttributes:rejecter:)
  func getAttributes(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
    let attr = Ribbon.shared.getAttributes()
    if (attr == nil){
      reject("Reject", "secondParam", nil)
    } else {
      resolve(attr)
    }
  }
  
  @objc
  func setAttributes(_ attributes: [String: Any]) {
    Ribbon.shared.setAttributes(attributes)
  }
  
  @objc
  func removeAttributes(key: [String]) {
    Ribbon.shared.removeAttributes(key)
  }
  
  @objc
  func removeAllAttributes() {
    Ribbon.shared.removeAllAttributes()
  }
  
  @objc
  func setIdentity(userId: String) {
    Ribbon.shared.setIdentity(userId)
  }
  
  @objc
  func setPreview(_ preview: Bool) {
    Ribbon.shared.setPreview(preview)
  }
  
  @objc
  func clearSession() {
    Ribbon.shared.clearSession()
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
