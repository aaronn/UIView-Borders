//
//  UIView+Borders.m
//
//  Created by Aaron Ng on 12/28/13.
//  Copyright (c) 2013 Delve. All rights reserved.
//

#import "UIView+Borders.h"

#import <objc/runtime.h>


@interface UIView ()


@end


@implementation UIView(Borders)

@dynamic topBorder;
@dynamic bottomBorder;
@dynamic leftBorder;
@dynamic rightBorder;

@dynamic vb_topBorder;
@dynamic vb_bottomBorder;
@dynamic vb_leftBorder;
@dynamic vb_rightBorder;

#pragma mark - Properties
-(CALayer *)topBorder {
    return objc_getAssociatedObject(self, @selector(topBorder));
}

-(void)setTopBorder:(CALayer *)topBorder{
    objc_setAssociatedObject(self, @selector(topBorder), topBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CALayer *)bottomBorder {
    return objc_getAssociatedObject(self, @selector(bottomBorder));
}

-(void)setBottomBorder:(CALayer *)bottomBorder{
    objc_setAssociatedObject(self, @selector(bottomBorder), bottomBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CALayer *)leftBorder {
    return objc_getAssociatedObject(self, @selector(leftBorder));
}

-(void)setLeftBorder:(CALayer *)leftBorder{
    objc_setAssociatedObject(self, @selector(leftBorder), leftBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CALayer *)rightBorder {
    return objc_getAssociatedObject(self, @selector(rightBorder));
}

-(void)setRightBorder:(CALayer *)rightBorder{
    objc_setAssociatedObject(self, @selector(rightBorder), rightBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)vb_topBorder {
    return objc_getAssociatedObject(self, @selector(vb_topBorder));
}

- (void)setVb_topBorder:(UIView *)topBorder {
    objc_setAssociatedObject(self, @selector(vb_topBorder), topBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)vb_bottomBorder {
    return objc_getAssociatedObject(self, @selector(vb_bottomBorder));
}

- (void)setVb_bottomBorder:(UIView *)bottomBorder{
    objc_setAssociatedObject(self, @selector(vb_bottomBorder), bottomBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)vb_leftBorder {
    return objc_getAssociatedObject(self, @selector(vb_leftBorder));
}

- (void)setVb_leftBorder:(UIView *)leftBorder{
    objc_setAssociatedObject(self, @selector(vb_leftBorder), leftBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)vb_rightBorder {
    return objc_getAssociatedObject(self, @selector(vb_rightBorder));
}

- (void)setVb_rightBorder:(UIView *)rightBorder{
    objc_setAssociatedObject(self, @selector(vb_rightBorder), rightBorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Top
-(CALayer*)createTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    return [self createTopBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andTopOffset:0];
}

-(UIView*)createViewBackedTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    return [self createViewBackedTopBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andTopOffset:0];
}

-(void)addTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addTopBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andTopOffset:0];
}

-(void)addViewBackedTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addViewBackedTopBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andTopOffset:0];
}

- (void)removeTopBorder {
    [self.topBorder removeFromSuperlayer];
}

- (void)removeViewBackedTopBorder {
    [self.vb_topBorder removeFromSuperview];
}

#pragma mark - Top + Offset
-(CALayer*)createTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset {
    // Subtract the bottomOffset from the height and the thickness to get our final y position.
    // Add a left offset to our x to get our x position.
    // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
    return [self getOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, 0 + topOffset, self.frame.size.width - leftOffset - rightOffset, height) andColor:color];
}

-(UIView*)createViewBackedTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset {
    UIView *border = [self getViewBackedOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, 0 + topOffset, self.frame.size.width - leftOffset - rightOffset, height) andColor:color];
    border.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    return border;
}

-(void)addTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset {
    // Add leftOffset to our X to get start X position.
    // Add topOffset to Y to get start Y position
    // Subtract left offset from width to negate shifting from leftOffset.
    // Subtract rightoffset from width to set end X and Width.
    [self.topBorder removeFromSuperlayer];
    
    self.topBorder = [self getOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, 0 + topOffset, self.frame.size.width - leftOffset - rightOffset, height) andColor:color];
    [self.layer addSublayer:self.topBorder];
}

-(void)addViewBackedTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset {
    [self.vb_topBorder removeFromSuperview];
    
    self.vb_topBorder = [self createViewBackedTopBorderWithHeight:height color:color leftOffset:leftOffset rightOffset:rightOffset andTopOffset:topOffset];
    [self addSubview:self.vb_topBorder];
}

#pragma mark - Right
-(CALayer*)createRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    return [self createRightBorderWithWidth:width color:color rightOffset:0 topOffset:0 andBottomOffset:0];
}

-(UIView*)createViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    return [self createViewBackedRightBorderWithWidth:width color:color rightOffset:0 topOffset:0 andBottomOffset:0];
}

-(void)addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addRightBorderWithWidth:width color:color rightOffset:0 topOffset:0 andBottomOffset:0];
}

- (void)removeRightBorder {
    [self.rightBorder removeFromSuperlayer];
}

- (void)removeViewBackedRightBorder {
    [self.vb_rightBorder removeFromSuperview];
}

-(void)addViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addViewBackedRightBorderWithWidth:width color:color rightOffset:0 topOffset:0 andBottomOffset:0];
}

#pragma mark - Right + Offset
-(CALayer*)createRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset{
    
    // Subtract bottomOffset from the height to get our end.
    return [self getOneSidedBorderWithFrame:CGRectMake(self.frame.size.width-width-rightOffset, 0 + topOffset, width, self.frame.size.height - topOffset - bottomOffset) andColor:color];
}

-(UIView*)createViewBackedRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset{
    UIView *border = [self getViewBackedOneSidedBorderWithFrame:CGRectMake(self.frame.size.width-width-rightOffset, 0 + topOffset, width, self.frame.size.height - topOffset - bottomOffset) andColor:color];
    border.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleHeight;
    return border;
}

-(void)addRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset{
    
    // Subtract the rightOffset from our width + thickness to get our final x position.
    // Add topOffset to our y to get our start y position.
    // Subtract topOffset from our height, so our border doesn't extend past teh view.
    // Subtract bottomOffset from the height to get our end.
    [self.rightBorder removeFromSuperlayer];
    
    self.rightBorder = [self getOneSidedBorderWithFrame:CGRectMake(self.frame.size.width-width-rightOffset, 0 + topOffset, width, self.frame.size.height - topOffset - bottomOffset) andColor:color];
    [self.layer addSublayer:self.rightBorder];
}

-(void)addViewBackedRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset{
    [self.vb_rightBorder removeFromSuperview];

    self.vb_rightBorder = [self createViewBackedRightBorderWithWidth:width color:color rightOffset:rightOffset topOffset:topOffset andBottomOffset:bottomOffset];
    [self addSubview:self.vb_rightBorder];
}

#pragma mark - Bottom
-(CALayer*)createBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    return [self createBottomBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andBottomOffset:0];
}

-(UIView*)createViewBackedBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    return [self createViewBackedBottomBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andBottomOffset:0];
}

-(void)addBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addBottomBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andBottomOffset:0];
}

-(void)addViewBackedBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addViewBackedBottomBorderWithHeight:height color:color leftOffset:0 rightOffset:0 andBottomOffset:0];
}

- (void)removeBottomBorder {
    [self.bottomBorder removeFromSuperlayer];
}

- (void)removeViewBackedBottomBorder {
    [self.vb_bottomBorder removeFromSuperview];
}

#pragma mark - Bottom + Offset
-(CALayer*)createBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset {
    // Subtract the bottomOffset from the height and the thickness to get our final y position.
    // Add a left offset to our x to get our x position.
    // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
    return [self getOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, self.frame.size.height-height-bottomOffset, self.frame.size.width - leftOffset - rightOffset, height) andColor:color];
}

-(UIView*)createViewBackedBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset{
    UIView *border = [self getViewBackedOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, self.frame.size.height-height-bottomOffset, self.frame.size.width - leftOffset - rightOffset, height) andColor:color];
    border.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    return border;
}

-(void)addBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset {
    // Subtract the bottomOffset from the height and the thickness to get our final y position.
    // Add a left offset to our x to get our x position.
    // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
    [self.bottomBorder removeFromSuperlayer];
    
    self.bottomBorder = [self getOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, self.frame.size.height-height-bottomOffset, self.frame.size.width - leftOffset - rightOffset, height) andColor:color];
    [self.layer addSublayer:self.bottomBorder];
}

-(void)addViewBackedBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset{
    [self.vb_bottomBorder removeFromSuperview];
    
    self.vb_bottomBorder = [self createViewBackedBottomBorderWithHeight:height color:color leftOffset:leftOffset rightOffset:rightOffset andBottomOffset:bottomOffset];
    [self addSubview:self.vb_bottomBorder];
}

#pragma mark - Left
-(CALayer*)createLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    return [self createLeftBorderWithWidth:width color:color leftOffset:0 topOffset:0 andBottomOffset:0];
}

-(UIView*)createViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    return [self createViewBackedLeftBorderWithWidth:width color:color leftOffset:0 topOffset:0 andBottomOffset:0];
}

-(void)addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addLeftBorderWithWidth:width color:color leftOffset:0 topOffset:0 andBottomOffset:0];
}

-(void)addViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addViewBackedLeftBorderWithWidth:width color:color leftOffset:0 topOffset:0 andBottomOffset:0];
}

- (void)removeLeftBorder {
    [self.leftBorder removeFromSuperlayer];
}

- (void)removeViewBackedLeftBorder {
    [self.vb_leftBorder removeFromSuperview];
}

#pragma mark - Left + Offset
-(CALayer*)createLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset {
    return [self getOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, 0 + topOffset, width, self.frame.size.height - topOffset - bottomOffset) andColor:color];
}

-(UIView*)createViewBackedLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset{
    UIView *border = [self getViewBackedOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, 0 + topOffset, width, self.frame.size.height - topOffset - bottomOffset) andColor:color];
    border.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleHeight;
    return border;
}

-(void)addLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset {
    [self.leftBorder removeFromSuperlayer];
    
    self.leftBorder = [self getOneSidedBorderWithFrame:CGRectMake(0 + leftOffset, 0 + topOffset, width, self.frame.size.height - topOffset - bottomOffset) andColor:color];
    [self.layer addSublayer:self.leftBorder];
}

-(void)addViewBackedLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset{
    [self.vb_leftBorder removeFromSuperview];
    
    self.vb_leftBorder = [self createViewBackedLeftBorderWithWidth:width color:color leftOffset:leftOffset topOffset:topOffset andBottomOffset:bottomOffset];
    [self addSubview:self.vb_leftBorder];
}

#pragma mark - Private
-(CALayer*)getOneSidedBorderWithFrame:(CGRect)frame andColor:(UIColor*)color
{
    CALayer *border = [CALayer layer];
    border.frame = frame;
    [border setBackgroundColor:color.CGColor];
    return border;
}

-(UIView*)getViewBackedOneSidedBorderWithFrame:(CGRect)frame andColor:(UIColor*)color
{
    UIView *border = [[UIView alloc]initWithFrame:frame];
    [border setBackgroundColor:color];
    return border;
}


@end
