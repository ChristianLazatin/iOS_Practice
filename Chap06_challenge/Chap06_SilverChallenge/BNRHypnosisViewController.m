//
//  BNRHypnosisViewController.m
//  Chap03_Challenge
//
//  Created by Christian Ramir Lazain on 5/12/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController


- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnonsisView *backgroundView = [[BNRHypnonsisView alloc] initWithFrame:frame];
    // Set it as *the* view of this view controller
    self.view = backgroundView;
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                       bundle:nibBundleOrNil];
    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view.");
    
}

- (void)viewWillAppear:(BOOL)animated
{
    //Create label
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 10, 300, 40);
    //label.textAlignment = UITextAlignmentCenter;
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label];
    
    //Create the segmented control
    NSArray *itemArray = [NSArray arrayWithObjects: @"Red", @"Green", @"Blue", nil];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(35, 200, 250, 50);
    //segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    //segmentedControl.selectedSegmentIndex = 1;
    
    [segmentedControl addTarget:self
                         action:@selector(pick: )
               forControlEvents:UIControlEventValueChanged];
    
	[self.view addSubview:segmentedControl];
}

- (void)pick:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"segmentedControl: %@", segmentedControl);
    
    if (segmentedControl.selectedSegmentIndex == 0){
        self.view.backgroundColor = [(BNRHypnonsisView *)self.view randomizeColor:0];
    }
    else if(segmentedControl.selectedSegmentIndex == 1 )
    {
        self.view.backgroundColor = [(BNRHypnonsisView *)self.view randomizeColor:1];
    }
    else {
        self.view.backgroundColor = [(BNRHypnonsisView *)self.view randomizeColor:2];
    }
}

@end
