//
//  CCPlanetImageViewController.h
//  Out Of This World
//
//  Created by Standard on 7/2/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCSpaceObject.h"

@interface CCPlanetImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic)UIImageView *imageView;
@property (strong, nonatomic)CCSpaceObject *mySpaceObject;
@property (strong, nonatomic) UIImage *myImage;

@end
