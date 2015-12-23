//
//  FantribeBanner.swift
//  WhisperDemo
//
//  Created by Jerapong Nampetch on 12/23/2558 BE.
//  Copyright © 2558 Ramon Gilabert Llop. All rights reserved.
//

import UIKit

class FantribeEventsVC : UIViewController {
  lazy var genericBannerButton: UIButton = {
    let button = UIButton()
    button.setTitle("Generic Banner", forState: .Normal)
    button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
    button.layer.borderColor = UIColor.grayColor().CGColor
    button.layer.borderWidth = 1
    button.backgroundColor = UIColor.lightGrayColor()
    
    return button
  }()
  
  lazy var genericCenter: UIButton = {
    let button = UIButton()
    button.setTitle("Generic with Center Alignment", forState: .Normal)
    button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
    button.layer.borderColor = UIColor.grayColor().CGColor
    button.layer.borderWidth = 1
    button.backgroundColor = UIColor.lightGrayColor()
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Fantribe events"
    view.backgroundColor = UIColor.whiteColor()
    
    view.addSubview(genericBannerButton)
    genericBannerButton.addTarget(self, action: "genericBannerTapped:", forControlEvents: .TouchUpInside)
    
    view.addSubview(genericCenter)
    genericCenter.addTarget(self, action: "genericCenterTapped:", forControlEvents: .TouchUpInside)
    
    setLayout()
  }
  
  let offset: CGFloat = 15
  let buttonHeight: CGFloat = 50
  
  private func yPosNextTo(button: UIButton) -> CGFloat {
    return CGRectGetMaxY(button.frame) + offset
  }
  
  func setLayout() {
    let buttonWidth: CGFloat = CGRectGetWidth(view.frame) - (offset * 2)
    genericBannerButton.frame = CGRectMake(offset, 150, buttonWidth, buttonHeight)
    genericCenter.frame = CGRectMake(offset, yPosNextTo(genericBannerButton), buttonWidth, buttonHeight)
  }
}

// MARK: - Actions

extension FantribeEventsVC {
  func genericBannerTapped(sender: UIButton) {
    let multilineText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ***** You can swipe up on this banner for dismiss *****"
    var body = BannerBody(type: .Generic(text: multilineText, imageName: "lightblue-led", alignment: .Left))
    body.supportSwipeUpForDismiss = true
    
    Banner(body, to: self)
    
    ClearBanner(self, after: 2)
  }
  
  func genericCenterTapped(sender: UIButton) {
    let text = "Connection lost"
    let body = BannerBody(type: .Generic(text: text, imageName: nil, alignment: .Center))
    Banner(body, to: self)
    
    ClearBanner(self, after: 2)
  }
}