//
//  ViewController.m
//  CustomFontExample
//
//  Created by Anthony Perozzo on 12/08/12.
//  Copyright (c) 2012 Gilthonwe Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myLabel;

- (void)dealloc
{
    [super dealloc];
    [myLabel release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myLabel.font = [UIFont fontWithName:@"Chicken Butt" size:40.0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.myLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
