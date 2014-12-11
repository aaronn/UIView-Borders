# UIView+Borders

**Add borders to everything!** A quick and simple UIView category to add one-sided borders to your UIViews. Supports both layer-backed borders and UIView backed borders, if layers aren't possible. Supports one-sided borders with offset amounts for top, right, bottom and left sides!

## Installation

### Without Cocoapods

Just add "UIView+Borders.h" and "UIView+Borders.m" to your project. 

### With Cocoapods

Add `pod 'UIView+Borders'` to your podfile; then run `pod update`.

## Usage
Import "UIView+Borders.h" and call any of the following on your UIView, specifying the thickness and color to get a CALayer backed border which you can then set into a property and add as a sublayer (or subview). There are also UIView-backed versions: check out UIView+Borders.h.

    // Top
    -(CALayer*)createTopBorderWithHeight: (CGFloat)height andColor:(UIColor*)color;
    -(CALayer*)createTopBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andTopOffset:(CGFloat)topOffset;

    // Right
    -(CALayer*)createRightBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
    -(CALayer*)createRightBorderWithWidth: (CGFloat)width color:(UIColor*)color rightOffset:(CGFloat)rightOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;

    // Bottom
    -(CALayer*)createBottomBorderWithHeight: (CGFloat)height andColor:(UIColor*)color;
    -(CALayer*)createBottomBorderWithHeight: (CGFloat)height color:(UIColor*)color leftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset andBottomOffset:(CGFloat)bottomOffset;

    // Left
    -(CALayer*)createLeftBorderWithWidth: (CGFloat)width andColor:(UIColor*)color;
    -(CALayer*)createLeftBorderWithWidth: (CGFloat)width color:(UIColor*)color leftOffset:(CGFloat)leftOffset topOffset:(CGFloat)topOffset andBottomOffset:(CGFloat)bottomOffset;


Alternatively, if you just want a quick border dropped into your UIView, use these methods which just add a border to the current view:

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
