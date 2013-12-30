//
//  UIView+Borders.m
//  Persona
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
    
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(0, 0, self.frame.size.width, height);
    [border setBackgroundColor:color.CGColor];
    [self.layer addSublayer:border];
    
}

-(void)addViewBackedTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
    [border setBackgroundColor:color];
    [self addSubview:border];
    
}

//////////
// Right
//////////

-(void)addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height);
    [border setBackgroundColor:color.CGColor];
    [self.layer addSublayer:border];
}

-(void)addViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-width, 0, width, self.frame.size.height)];
    [border setBackgroundColor:color];
    [self addSubview:border];
}

//////////
// Bottom
//////////

-(void)addBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height);
    [border setBackgroundColor:color.CGColor];
    [self.layer addSublayer:border];
}

-(void)addViewBackedBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color{
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height)];
    [border setBackgroundColor:color];
    [self addSubview:border];
}

//////////
// Left
//////////

-(void)addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(0, 0, width, self.frame.size.height);
    [border setBackgroundColor:color.CGColor];
    [self.layer addSublayer:border];
}

-(void)addViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color{
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
    [border setBackgroundColor:color];
    [self addSubview:border];
}


@end
