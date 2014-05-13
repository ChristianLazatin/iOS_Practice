//
//  BNRHypnonsisView.m
//  Chap03_Challenge
//
//  Created by Christian Ramir Lazain on 5/9/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnonsisView ()
//@property (strong, nonatomic) UIColor *circleColor;
@end

@implementation BNRHypnonsisView

@synthesize circleColor = _circleColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
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
    [self.circleColor setStroke];
    // Draw the line!
    [path stroke];
    
    /*///This is the bronze challenge: Add the shadows
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
    CGContextRestoreGState(currentContext);*/

    /*This part is for the bronze challenge: display the image on the view*/
    /*UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect imageFrame = self.window.bounds;
    [logoImage drawInRect:imageFrame];*/
}

// When a finger touches the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    [self randomizeColor:3];
    //self.circleColor = [self randomizeColor:3];
    //Redisplays the view
    //[self setNeedsDisplay];
}

- (UIColor*)randomizeColor:(int)i
{
    UIColor *randomColor;
    if (i == 0) {
        randomColor = [UIColor colorWithRed:1
                                      green:0
                                       blue:0
                                      alpha:1.0];
    } else if (i == 1){
        randomColor = [UIColor colorWithRed:0
                                      green:1
                                       blue:0
                                      alpha:1.0];
    } else if (i == 2){
        randomColor = [UIColor colorWithRed:0
                                      green:0
                                       blue:1
                                      alpha:1.0];
    } else{
    // Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    randomColor = [UIColor colorWithRed:red
                                  green:green
                                   blue:blue
                                  alpha:1.0];
    }
    [self setCircleColor:randomColor];
    _circleColor = randomColor;
    [self setNeedsDisplay];
    return randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    
    //_circleColor = [self randomizeColor];
    
    [self setNeedsDisplay];
}

@end
