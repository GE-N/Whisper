//
//  BannerFactory.swift
//  WhisperDemo
//
//  Created by Jerapong Nampetch on 12/23/2558 BE.
//  Copyright © 2558 Ramon Gilabert Llop. All rights reserved.
//

import UIKit

let bannerFactory: BannerFactory = BannerFactory()

public func Banner(banner: BannerBody, to: UIViewController) {
  bannerFactory.craft(banner, on: to)
}

class BannerFactory: NSObject {
  struct AnimationTiming {
    static let movement: NSTimeInterval = 0.3
    static let switcher: NSTimeInterval = 0.1
    static let popUp: NSTimeInterval = 1.5
    static let loaderDuration: NSTimeInterval = 0.7
    static let totalDelay: NSTimeInterval = popUp + movement * 2
  }
  
  var bannerView: BannerView!
  var bannerDetails: BannerBody!
  var presentVC: UIViewController!
  
  func craft(details: BannerBody, on vc: UIViewController) {
    bannerView = BannerView()
    bannerDetails = details
    presentVC = vc
    bannerView.style = self
    bannerView.delegate = self
    
    presentVC.view.addSubview(bannerView)
    presentView()
  }
  
  func presentView() {
    guard presentVC.navigationController != nil else {
      print("Banner: Can not found UINavigationController instance on \(presentVC)")
      return
    }
    
    UIView.animateWithDuration(AnimationTiming.movement) { [unowned self] in
      self.bannerView.frame.origin.y = 64
    }
  }
}

extension BannerFactory : BannerViewDelegate {
  func onViewController() -> UIViewController {
    return presentVC
  }
  
  func bannerText() -> String {
    return bannerDetails.text
  }
  
  func bannerImageName() -> String? {
    return bannerDetails.imageName
  }
}

extension BannerFactory : BannerViewStyle {
  func labelTextAlignment() -> NSTextAlignment? {
    return bannerDetails.textAlignment
  }
  
  func backgroundColor() -> UIColor {
    return bannerDetails.color
  }
}