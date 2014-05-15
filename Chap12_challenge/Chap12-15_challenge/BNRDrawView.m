//
//  BNRDrawView.m
//  Chap12-15_challenge
//
//  Created by Christian Ramir Lazain on 5/15/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView () <NSCoding>

@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (void)strokeLine:(BNRLine *)line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}


-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeObject: self.finishedLines];
}

- (void)drawRect:(CGRect)rect
{
    for (BNRLine *line in self.finishedLines) {
        /*Saving data
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:line];
        NSMutableData *saveData = [data mutableCopy];
        [data writeToFile:@"/tmp/line" atomically:YES];*/
        
        //Silver Challenge: change the line color depending on its angle
        float angle = [self lineAtPoint:line];
        
        //use the 4 quadrant as a basis
        if (angle > 0 && angle <= 90)
            [[UIColor blueColor] setStroke];
        else if (angle > 90 && angle <= 180)
            [[UIColor yellowColor] setStroke];
        else if(angle <= -90 && angle > 0)
            [[UIColor brownColor] setStroke];
        else
            [[UIColor greenColor] setStroke];
        
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }

}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches
withEvent:(UIEvent *)event
{
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

- (float)lineAtPoint:(BNRLine *)p
{
    CGPoint start = p.begin;
    CGPoint end = p.end;
    //distance between the two points
    int X = start.x - end.x;
    int Y = start.y - end.y;
    
    //angle in radian
    float angleInRadian = atan2((double)Y,(double)X);
    float angleInDegree = angleInRadian * 180 / M_PI;
    return angleInDegree;
}

@end
