//
//  UIView+Borders.h
//
//  Created by Aaron Ng on 12/28/13.
//  Copyright (c) 2013 Delve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Borders)

/** A method for adding a border to the top of an UIView via a CALayer. Use this when possible over the view-backed version for performance reasons.
 
 Only one border can exist in each position.
 
 @param height A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addViewBackedTopBorderWithHeight:andColor
 */
-(void)addTopBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;


/** A method for adding a border to the top of an UIView via another UIView. Use this if you can't use the layer-backed version for whatever reason.
 
 Only one border can exist in each position.
 
 @param height A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addTopBorderWithHeight:andColor
 */
-(void)addViewBackedTopBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;


/** A method for adding a border to the top of an UIView via a CALayer. Use this when possible over the view-backed version for performance reasons.
 
 Only one border can exist in each position.
 
 @param width A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addViewBackedRightBorderWithHeight:andColor
 */
-(void)addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;


/** A method for adding a border to the top of an UIView via another UIView. Use this if you can't use the layer-backed version for whatever reason.
 
 Only one border can exist in each position.
 
 @param width A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addRightBorderWithWidth:andColor
 */
-(void)addViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;


/** A method for adding a border to the top of an UIView via a CALayer. Use this when possible over the view-backed version for performance reasons.
 
 Only one border can exist in each position.
 
 @param height A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addViewBackedBottomBorderWithHeight:andColor
 */
-(void)addBottomBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;


/** A method for adding a border to the top of an UIView via another UIView. Use this if you can't use the layer-backed version for whatever reason.
 
 Only one border can exist in each position.
 
 @param height A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addBottomBorderWithHeight:andColor
 */
-(void)addViewBackedBottomBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;


/** A method for adding a border to the left of an UIView via a CALayer. Use this when possible over the view-backed version for performance reasons.
 
 Only one border can exist in each position.
 
 @param width A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addViewBackedLeftBorderWithHeight:andColor
 */
-(void)addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;


/** A method for adding a border to the left of an UIView via another UIView. Use this if you can't use the layer-backed version for whatever reason.
 
 Only one border can exist in each position.
 
 @param width A float specifying the thickness of the border.
 @param color A UIColor specifying the color of the border.
 @see addLeftBorderWithHeight:andColor
 */
-(void)addViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;


@end
