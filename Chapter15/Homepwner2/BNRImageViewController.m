//
//  BNRImageViewController.m
//  Homepwner2
//
//  Created by Christian Ramir Lazain on 5/7/14.
//  Copyright (c) 2014 klab. All rights reserved.
//

#import "BNRImageViewController.h"

@interface BNRImageViewController ()

@end

@implementation BNRImageViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //We must cast the view to UIImageView so the compiler knows it is okay to send it setImage
    UIImageView *imageView = (UIImageView *)self.view;
    imageView.image = self.image;
}

- (void)loadView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.view = imageView;
}

@end
