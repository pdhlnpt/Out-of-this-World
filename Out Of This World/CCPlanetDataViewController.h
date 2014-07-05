//
//  CCPlanetDataViewController.h
//  Out Of This World
//
//  Created by Standard on 7/3/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCSpaceObject.h"

@interface CCPlanetDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CCSpaceObject *myPlanet;
@end
