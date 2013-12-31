# UIView+Borders

**Add borders to everything!** A quick and simple UIView category to add one-sided borders to your UIViews. Supports both layer-backed borders and UIView backed borders, if layers aren't possible.

## Installation
Just add "UIView+Borders.h" and "UIView+Borders.m" to your project. 

## Usage
Import "UIView+Borders.h" and call any of the following on your UIView, specifying the thickness and color. Use the non-ViewBacked versions when possible for performance reasons:

    // Top Border
    -(void)addTopBorderWithHeight:(CGFloat)height andColor:(UIColor*)color;
    -(void)addViewBackedTopBorderWithHeight:(CGFloat)height andColor:(UIColor*)color

    // Right Border
    -(void)addRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color
    -(void)addViewBackedRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color

    // Bottom Border
    -(void)addBottomBorderWithHeight:(CGFloat)height andColor:(UIColor*)color
    -(void)addViewBackedBottomBorderWithHeight:(CGFloat)height andColor:(UIColor*)color

    // Left Border
    -(void)addLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color
    -(void)addViewBackedLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color

## Why One Sided Borders?
One sided borders are an awesome tool for highlighting, recessing or separating various UI elements. For example, a light top-border with a dark bottom-border can be used to make something appear raised while a dark top-border makes the element look recessed. It's also handy for visually separating two views next to each other-- using a traditional layer border means doubling up on the width where the two views meet.
