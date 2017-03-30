//
//  UIView+Borders.swift
//  UIView-Borders
//
//  Created by Tommie N. Carter, Jr., MBA on 3/27/17.
//  Copyright © 2017 MING Technology. All rights reserved.
//

import UIKit

extension UIView {
  //////////
  // Top
  //////////
  func createTopBorder(with height:CGFloat, and color: UIColor) -> CALayer {
    return self.createTopBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  func createViewBackedTopBorder(with height:CGFloat, and color: UIColor) -> UIView {
    return self.createViewBackedTopBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  func addTopBorder(with height:CGFloat, and color: UIColor) {
    self.addTopBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  func addViewBackedTopBorder(with height:CGFloat, and color: UIColor)  {
    self.addViewBackedTopBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  //////////
  // Top + Offset
  //////////
  func createTopBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and topOffset:CGFloat) -> CALayer {
    // Subtract the bottomOffset from the height and the thickness to get our final y position.
    // Add a left offset to our x to get our x position.
    // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
    return self.getOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: 0 + topOffset, width: self.frame.size.width - leftOffset - rightOffset, height: height), and: color)
  }
  func createViewBackedTopBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and topOffset:CGFloat) ->UIView {
    let borderView = self.getViewBackedOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: 0 + topOffset, width: self.frame.size.width - leftOffset - rightOffset, height: height), and: color)
    borderView.autoresizingMask = [.flexibleWidth,.flexibleBottomMargin] //UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin
    return borderView
  }
  func addTopBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and topOffset:CGFloat)  {
    // Add leftOffset to our X to get start X position.
    // Add topOffset to Y to get start Y position
    // Subtract left offset from width to negate shifting from leftOffset.
    // Subtract rightoffset from width to set end X and Width.
    self.addOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: 0 + topOffset, width: self.frame.size.width - leftOffset - rightOffset, height: height), and: color)
  }
  func addViewBackedTopBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and topOffset:CGFloat)  {
    let borderView = self.createViewBackedTopBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
    self.addSubview(borderView)
  }
  //////////
  // Right
  //////////
  func createRightBorder(with width:CGFloat, and color: UIColor) -> CALayer {
    return self.createRightBorder(with: width, color: color, rightOffset: 0.0, topOffset: 0.0, and: 0.0)
  }
  func createViewBackedRightBorder(with width:CGFloat, and color: UIColor) -> UIView {
    return self.createViewBackedRightBorder(with: width, color: color, rightOffset: 0.0, topOffset: 0.0, and: 0.0)
  }
  func addRightBorder(with width:CGFloat, and color: UIColor) {
    self.addRightBorder(with: width, color: color, rightOffset: 0.0, topOffset: 0.0, and: 0.0)
  }
  func addViewBackedRightBorder(with width:CGFloat, and color: UIColor)  {
    self.addViewBackedRightBorder(with: width, color: color, rightOffset: 0.0, topOffset: 0.0, and: 0.0)
  }
  //////////
  // Right + Offset
  //////////
  func createRightBorder( with width: CGFloat, color:UIColor, rightOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat) ->CALayer {
    // Subtract bottomOffset from the height to get our end.
    return getOneSidedBorder(with: CGRect(x: self.frame.size.width-width-rightOffset, y: 0 + topOffset, width: width, height: self.frame.size.height - topOffset - bottomOffset), and: color)
  }
   func createViewBackedRightBorder(with width: CGFloat, color:UIColor, rightOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat) -> UIView {
    let borderView = self.getViewBackedOneSidedBorder(with: CGRect(x: self.frame.size.width-width-rightOffset, y: 0 + topOffset, width: width, height: self.frame.size.height - topOffset - bottomOffset) , and: color)
    borderView.autoresizingMask = [.flexibleLeftMargin, .flexibleHeight]//UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleHeight
    return borderView
  }
  func addRightBorder( with width: CGFloat, color:UIColor, rightOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat)  {
  
    // Subtract the rightOffset from our width + thickness to get our final x position.
    // Add topOffset to our y to get our start y position.
    // Subtract topOffset from our height, so our border doesn't extend past teh view.
    // Subtract bottomOffset from the height to get our end.
    self.addOneSidedBorder(with: CGRect(x: self.frame.size.width-width-rightOffset, y: 0 + topOffset, width: width, height: self.frame.size.height - topOffset - bottomOffset) , and: color)
  }
  func addViewBackedRightBorder(with width: CGFloat, color:UIColor, rightOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat)  {
    let borderView = self.createViewBackedRightBorder(with: width, color: color, rightOffset: 0.0, topOffset: 0.0, and: 0.0)
    self.addSubview(borderView)
  }
  //////////
  // Bottom
  //////////
  func createBottomBorder(with height:CGFloat, and color: UIColor) -> CALayer {
    return self.createBottomBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  func createViewBackedBottomBorder(with height:CGFloat, and color: UIColor) -> UIView {
    return self.createViewBackedBottomBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  func addBottomBorder(with height:CGFloat, and color: UIColor) {
    self.addBottomBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  func addViewBackedBottomBorder(with height:CGFloat, and color: UIColor)  {
    self.addViewBackedBottomBorder(with: height, color: color, leftOffset: 0.0, rightOffset: 0.0, and: 0.0)
  }
  //////////
  // Bottom + Offset
  //////////
  func createBottomBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and bottomOffset:CGFloat) -> CALayer {
    // Subtract the bottomOffset from the height and the thickness to get our final y position.
    // Add a left offset to our x to get our x position.
    // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
    return self.getOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: self.frame.size.height-height-bottomOffset, width: self.frame.size.width - leftOffset - rightOffset, height: height), and: color)
  }
  func createViewBackedBottomBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and bottomOffset:CGFloat) ->UIView {
    let borderView = self.getViewBackedOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: self.frame.size.height-height-bottomOffset, width: self.frame.size.width - leftOffset - rightOffset, height: height), and: color)
    borderView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin] //UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
  
    return borderView
  }
  func addBottomBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and bottomOffset:CGFloat)  {
    // Subtract the bottomOffset from the height and the thickness to get our final y position.
    // Add a left offset to our x to get our x position.
    // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
    self.addOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: self.frame.size.height-height-bottomOffset, width: self.frame.size.width - leftOffset - rightOffset,height: height), and: color)
  }
  func addViewBackedBottomBorder(with height: CGFloat, color:UIColor, leftOffset:CGFloat, rightOffset:CGFloat, and bottomOffset:CGFloat)  {
    let borderView = self.createViewBackedBottomBorder(with: height, color: color, leftOffset: leftOffset, rightOffset: rightOffset, and: bottomOffset)
    self.addSubview(borderView)
  }
  //////////
  // Left
  //////////
  func createLeftBorder(with width:CGFloat, and color: UIColor) -> CALayer {
    return self.createLeftBorder(with: width, color: color, leftOffset: 0.0, topOffset: 0.0, and: 0.0)
  
  }
  func createViewBackedLeftBorder(with width:CGFloat, and color: UIColor) -> UIView {
    return createViewBackedLeftBorder(with: width, color: color, leftOffset: 0.0, topOffset: 0.0, and: 0.0)
  }
  func addLeftBorder(with width:CGFloat, and color: UIColor) {
    self.addLeftBorder(with: width, color: color, leftOffset: 0.0, topOffset: 0.0, and: 0.0)
  }
  func addViewBackedLeftBorder(with width:CGFloat, and color: UIColor)  {
    
    self.addViewBackedLeftBorder(with: width, color: color, leftOffset: 0.0, topOffset: 0.0, and: 0.0)
    
  }
  //////////
  // Left + Offset
  //////////
  func createLeftBorder( with width: CGFloat, color:UIColor, leftOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat) -> CALayer {
  
    return getOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: 0 + topOffset, width: width, height: self.frame.size.height - topOffset - bottomOffset) , and: color)
  }
  func createViewBackedLeftBorder(with width: CGFloat, color:UIColor, leftOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat) -> UIView {
    let borderView = getViewBackedOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: 0 + topOffset, width: width, height: self.frame.size.height - topOffset - bottomOffset) , and: color)
    borderView.autoresizingMask = [.flexibleRightMargin , .flexibleHeight] //UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleHeight;
    return borderView
  }
  func addLeftBorder( with width: CGFloat, color:UIColor, leftOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat)  {
    self.addOneSidedBorder(with: CGRect(x: 0 + leftOffset, y: 0 + topOffset, width: width, height: self.frame.size.height - topOffset - bottomOffset), and: color)
  }
  func addViewBackedLeftBorder(with width: CGFloat, color:UIColor, leftOffset:CGFloat, topOffset:CGFloat, and bottomOffset:CGFloat)  {
    let borderView = self.createViewBackedLeftBorder(with: width, color: color, leftOffset: leftOffset, topOffset: topOffset, and: bottomOffset)
    self.addSubview(borderView)
  }
  //////////
  // Private: Our methods call these to add their borders.
  //////////
  func addOneSidedBorder(with frame:CGRect, and color:UIColor){
    let borderLayer = self.getOneSidedBorder(with: frame, and: color)
    self.layer.addSublayer(borderLayer)
  }
  func getOneSidedBorder(with frame:CGRect, and color:UIColor) -> CALayer {
    let borderLayer = CALayer()
    borderLayer.frame = frame
    borderLayer.backgroundColor = color.cgColor
    return borderLayer
  
  }
  func getViewBackedOneSidedBorder(with frame:CGRect, and color:UIColor) -> UIView {
    let borderView = UIView(frame: frame)
    borderView.backgroundColor = color
    return borderView
  }
}
