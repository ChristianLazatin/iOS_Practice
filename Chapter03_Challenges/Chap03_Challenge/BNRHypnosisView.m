//
//  BNRHypnonsisView.m
//  Chap03_Challenge
//
//  Created by Christian Ramir Lazain on 5/9/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnonsisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
    [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
    [path addArcWithCenter:center
                    radius:currentRadius // Note this is currentRadius!
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    }
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor grayColor] setStroke];
    // Draw the line!
    [path stroke];
    
    ///This is the bronze challenge: Add the shadows
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    ///This is the Gold challenge: Draw a triangle and add gradient on it
    //Draw the triangle
    CGPoint startPoint = {bounds.size.width/2, 0.0}, endPoint = {bounds.size.width - bounds.size.width*.2, bounds.size.height};
    CGPoint thirdPoint = CGPointMake(bounds.size.width*.2, endPoint.y);
    UIBezierPath *triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:startPoint];
    [triangle addLineToPoint:endPoint];
    [triangle addLineToPoint:thirdPoint];
    [triangle closePath];
    [[UIColor redColor] setStroke];
    [triangle stroke];
    
    //Save current state before adding gradient
    CGContextSaveGState(currentContext);
    [triangle addClip];
    
    //Start adding gradient
    CGGradientRef gradient;
    CGColorSpaceRef colorspace;
    size_t num_locations = 3;
    CGFloat locations[] = {0.0,1.0,1.0};//{ bounds.size.width/2, bounds.size.width-bounds.size.width*2 };
    CGFloat components[8] = { 0.0, 1.0, 0.0, 1.0,  // Start color
        1.0, 1.0, 0.0, 1.0 }; // End color
    
    colorspace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColorComponents (colorspace, components, locations, num_locations);
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    //Restore last saved state
    CGContextRestoreGState(currentContext);

    /*This part is for the bronze challenge: display the image on the view*/
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect imageFrame = self.window.bounds;
    [logoImage drawInRect:imageFrame];
}

@end
