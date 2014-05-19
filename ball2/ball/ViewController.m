//
//  ViewController.m
//  ball
//
//  Created by Christian Ramir Lazain on 5/16/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation ViewController

@synthesize audioPlayer;

- (void)play
{
    //Background music
    NSString *stringPath = [[NSBundle mainBundle] pathForResource:@"Mario" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:stringPath];
    
    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    //infinite loop
    [self.audioPlayer setNumberOfLoops:-1];
    [self.audioPlayer setVolume:0.1];
    
    [self.audioPlayer play];
}

- (IBAction)sound:(id)sender {
    //Try to add a music to an event
   NSString *stringPath = [[NSBundle mainBundle] pathForResource:@"okay" ofType:@"caf"];
    NSLog(@"%@", stringPath);
    NSURL *url = [NSURL fileURLWithPath:stringPath];
    
    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    [self.audioPlayer setNumberOfLoops:0];
    [self.audioPlayer setVolume:1];
    
    [self.audioPlayer play];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib

    UIImage *ballImage = [UIImage imageNamed:@"ball"];
    UIImageView *ball = [[UIImageView alloc] initWithImage:ballImage];
    
    [self.view addSubview:ball];
    [self play];
    [self addFallAnimationForLayer:ball.layer];
}

- (void)addFallAnimationForLayer:(CALayer *)layer{
    
    // The keyPath to animate
    NSString *keyPath = @"transform.translation.y";
    
    // Allocate a CAKeyFrameAnimation for the specified keyPath.
    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    // Allocate array to hold the timing functions
    NSMutableArray *timingFunctions = [[NSMutableArray alloc] init];
    
    // add a timing function for the first animation step to ease in the animation
    // this step crudely simulates gravity by easing in the effects of y offset
    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    // Set the timing functions that should be used to calculate interpolation between the first two keyframes
    translation.timingFunctions = timingFunctions;
    
    // Set animation duration and repeat
    translation.duration = 1.5f;
    translation.repeatCount = HUGE_VAL;
    
    // Allocate array to hold the values to interpolate
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    // Add the start value
    // The animation starts at a y offset of 0.0
    [values addObject:[NSNumber numberWithFloat:0.0f]];
    
    // Add the end value
    // The animation finishes when the ball would contact the bottom of the screen
    // This point is calculated by finding the height of the applicationFrame
    // and subtracting the height of the ball.
    CGFloat height = [[UIScreen mainScreen] applicationFrame].size.height - layer.frame.size.height;
    [values addObject:[NSNumber numberWithFloat:height]];
    
    // Set the values that should be interpolated during the animation
    translation.values = values;
    
    translation.autoreverses = YES;
    [layer addAnimation:translation forKey:keyPath];
    
}

@end
