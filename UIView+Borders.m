//
//  UIView+Borders.m
//
//  Created by Aaron Ng on 12/28/13.
//  Copyright (c) 2013 Delve. All rights reserved.
//

#import "UIView+Borders.h"


@implementation UIView(Borders)

//////////
// Top
//////////

-(void)addTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addOneSidedBorderWithFrame:CGRectMake(0, 0, self.frame.size.width, height) andColor:color];
}

-(void)addViewBackedTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addViewBackedOneSidedBorderWithFrame:CGRectMake(0, 0, self.frame.size.width, height) andColor:color];
}

//////////
// Right
//////////

-(void)addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addOneSidedBorderWithFrame:CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height) andColor:color];
}

-(void)addViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addViewBackedOneSidedBorderWithFrame:CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height) andColor:color];
}

//////////
// Bottom
//////////

-(void)addBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addOneSidedBorderWithFrame:CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height) andColor:color];
}

-(void)addViewBackedBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    [self addViewBackedOneSidedBorderWithFrame:CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height) andColor:color];
}

//////////
// Left
//////////

-(void)addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addOneSidedBorderWithFrame:CGRectMake(0, 0, width, self.frame.size.height) andColor:color];
}

-(void)addViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    [self addViewBackedOneSidedBorderWithFrame:CGRectMake(0, 0, width, self.frame.size.height) andColor:color];
}

//////////
// Private: Our methods call these to add their borders.
//////////

-(void)addOneSidedBorderWithFrame:(CGRect)frame andColor:(UIColor*)color
{
    CALayer *border = [CALayer layer];
    border.frame = frame;
    [border setBackgroundColor:color.CGColor];
    [self.layer addSublayer:border];
}

-(void)addViewBackedOneSidedBorderWithFrame:(CGRect)frame andColor:(UIColor*)color
{
    UIView *border = [[UIView alloc]initWithFrame:frame];
    [border setBackgroundColor:color];
    [self addSubview:border];
}


@end
