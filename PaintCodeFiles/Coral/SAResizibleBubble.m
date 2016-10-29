//
//  SAResizibleBubble.m
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Copyright (c) 2013 Andrei Solovjev - http://solovjev.com/
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SAResizibleBubble.h"

@implementation SAResizibleBubble

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* bubbleGradientTop = [UIColor colorWithRed: 0.98 green: 0.365 blue: 0.408 alpha: 1];
    UIColor* bubbleGradientBottom = [UIColor colorWithRed: 0.98 green: 0.365 blue: 0.408 alpha: 0.788];
    UIColor* bubbleHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* bubbleStrokeColor = [UIColor colorWithRed: 0.231 green: 0.231 blue: 0.231 alpha: 1];
    
    //// Gradient Declarations
    CGFloat bubbleGradientLocations[] = {0, 1};
    CGGradientRef bubbleGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)bubbleGradientTop.CGColor, (id)bubbleGradientBottom.CGColor], bubbleGradientLocations);
    
    //// Shadow Declarations
    NSShadow* outerShadow = [[NSShadow alloc] init];
    [outerShadow setShadowColor: UIColor.blackColor];
    [outerShadow setShadowOffset: CGSizeMake(0.1, 6.1)];
    [outerShadow setShadowBlurRadius: 13];
    NSShadow* highlightShadow = [[NSShadow alloc] init];
    [highlightShadow setShadowColor: bubbleHighlightColor];
    [highlightShadow setShadowOffset: CGSizeMake(0.1, 2.1)];
    [highlightShadow setShadowBlurRadius: 0];
    
    
    //// Subframes
    CGRect arrowFrame = CGRectMake(CGRectGetMinX(bubbleFrame) + floor((CGRectGetWidth(bubbleFrame) - 59) * 0.50462 + 0.5), CGRectGetMinY(bubbleFrame) + CGRectGetHeight(bubbleFrame) - 46, 59, 46);
    
    
    //// Bubble Drawing
    UIBezierPath* bubblePath = [UIBezierPath bezierPath];
    [bubblePath moveToPoint: CGPointMake(CGRectGetMaxX(bubbleFrame) - 12, CGRectGetMinY(bubbleFrame) + 28.5)];
    [bubblePath addLineToPoint: CGPointMake(CGRectGetMaxX(bubbleFrame) - 12, CGRectGetMaxY(bubbleFrame) - 27.5)];
    [bubblePath addCurveToPoint: CGPointMake(CGRectGetMaxX(bubbleFrame) - 25, CGRectGetMaxY(bubbleFrame) - 14.5) controlPoint1: CGPointMake(CGRectGetMaxX(bubbleFrame) - 12, CGRectGetMaxY(bubbleFrame) - 20.32) controlPoint2: CGPointMake(CGRectGetMaxX(bubbleFrame) - 17.82, CGRectGetMaxY(bubbleFrame) - 14.5)];
    [bubblePath addLineToPoint: CGPointMake(CGRectGetMinX(arrowFrame) + 40.5, CGRectGetMaxY(arrowFrame) - 13.5)];
    [bubblePath addLineToPoint: CGPointMake(CGRectGetMinX(arrowFrame) + 29.5, CGRectGetMaxY(arrowFrame) - 0.5)];
    [bubblePath addLineToPoint: CGPointMake(CGRectGetMinX(arrowFrame) + 18.5, CGRectGetMaxY(arrowFrame) - 13.5)];
    [bubblePath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 26.5, CGRectGetMaxY(bubbleFrame) - 14.5)];
    [bubblePath addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 13.5, CGRectGetMaxY(bubbleFrame) - 27.5) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 19.32, CGRectGetMaxY(bubbleFrame) - 14.5) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 13.5, CGRectGetMaxY(bubbleFrame) - 20.32)];
    [bubblePath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 13.5, CGRectGetMinY(bubbleFrame) + 28.5)];
    [bubblePath addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 26.5, CGRectGetMinY(bubbleFrame) + 15.5) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 13.5, CGRectGetMinY(bubbleFrame) + 21.32) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 19.32, CGRectGetMinY(bubbleFrame) + 15.5)];
    [bubblePath addLineToPoint: CGPointMake(CGRectGetMaxX(bubbleFrame) - 25, CGRectGetMinY(bubbleFrame) + 15.5)];
    [bubblePath addCurveToPoint: CGPointMake(CGRectGetMaxX(bubbleFrame) - 12, CGRectGetMinY(bubbleFrame) + 28.5) controlPoint1: CGPointMake(CGRectGetMaxX(bubbleFrame) - 17.82, CGRectGetMinY(bubbleFrame) + 15.5) controlPoint2: CGPointMake(CGRectGetMaxX(bubbleFrame) - 12, CGRectGetMinY(bubbleFrame) + 21.32)];
    [bubblePath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, outerShadow.shadowOffset, outerShadow.shadowBlurRadius, [outerShadow.shadowColor CGColor]);
    CGContextBeginTransparencyLayer(context, NULL);
    [bubblePath addClip];
    CGRect bubbleBounds = CGPathGetPathBoundingBox(bubblePath.CGPath);
    CGContextDrawLinearGradient(context, bubbleGradient,
                                CGPointMake(CGRectGetMidX(bubbleBounds), CGRectGetMinY(bubbleBounds)),
                                CGPointMake(CGRectGetMidX(bubbleBounds), CGRectGetMaxY(bubbleBounds)),
                                0);
    CGContextEndTransparencyLayer(context);
    
    ////// Bubble Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(bubblePath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([highlightShadow.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [highlightShadow.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, highlightShadow.shadowOffset, highlightShadow.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [bubblePath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    [bubbleStrokeColor setStroke];
    bubblePath.lineWidth = 1;
    [bubblePath stroke];
    
    
    //// Cleanup
    CGGradientRelease(bubbleGradient);
    CGColorSpaceRelease(colorSpace);
}


@end
