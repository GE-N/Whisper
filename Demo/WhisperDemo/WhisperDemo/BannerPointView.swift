//
//  BannerPointView.swift
//  WhisperDemo
//
//  Created by Jerapong Nampetch on 12/24/2558 BE.
//  Copyright © 2558 Ramon Gilabert Llop. All rights reserved.
//

import UIKit

public class BannerPointView : UIView, BannerDelegate {
  struct Dimension {
    static let offset: CGFloat = 8
    static let width: CGFloat = screenWidth
  }
  
  public lazy var textLabel: UICountingLabel = {
    let label = UICountingLabel()
    label.numberOfLines = 1
    label.format = "%d"
    
    return label
  }()
  
  public lazy var detailsLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    return label
  }()
  
  let bannerFont = UIFont.systemFontOfSize(13)
  
  lazy private(set) var transformViews: [UIView] = [self.textLabel, self.detailsLabel]
  
  var points: Int16!
  var addition: Int16!
  
  var delegate: BannerViewDelegate! {
    didSet { setupFrame() }
  }
  
  var style: BannerViewStyle? {
    didSet { setupStyle() }
  }
  
  init(point: Int16, add: Int16, details: String) {
    super.init(frame: CGRectZero)
    transformViews.forEach { addSubview($0) }
    
    points = point
    addition = add
    
    textLabel.text    = "\(point)"
    detailsLabel.text = "\(add) : \(details)"
  }

  func setupFrame() {
    transformViews.forEach { initiateLabel($0 as! UILabel) }
    textLabel.frame.origin = CGPointMake(Dimension.offset, Dimension.offset)
    detailsLabel.frame.origin.x = screenWidth - Dimension.offset - CGRectGetWidth(detailsLabel.frame)
    detailsLabel.frame.origin.y = Dimension.offset
    
    textLabel.frame.size.width = screenWidth - CGRectGetMinX(detailsLabel.frame) - (Dimension.offset * 2)
    frame = delegate.onViewController().view.frame
    frame.size.height = CGRectGetHeight(textLabel.frame) + (Dimension.offset * 2)
  }
  
  func setupStyle() {
    
  }
  
  private func initiateLabel(label: UILabel) {
    label.font = bannerFont
    label.sizeToFit()
  }
  
  func beginAnimation() {
    textLabel.countFrom(CGFloat(points), to: CGFloat(points+addition), withDuration: 1)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}