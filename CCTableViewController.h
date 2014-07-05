//
//  CCTableViewController.h
//  Out Of This World
//
//  Created by Standard on 7/2/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCAddPlanetViewController.h"

@interface CCTableViewController : UITableViewController <CCAddPlanetVCDelegate>

@property (strong, nonatomic)NSMutableArray *planets;
@property (strong, nonatomic)NSMutableArray *addedPlanet;
@end
