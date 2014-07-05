//
//  CCSpaceObject.h
//  Out Of This World
//
//  Created by Standard on 7/2/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCSpaceObject : NSObject
@property (strong, nonatomic)UIImage *planetImage;
@property (strong, nonatomic)NSString *planetName;
@property (nonatomic)float planetGravity;
@property (nonatomic)float planetDiameter;
@property (nonatomic)float planetYearLength;
@property (nonatomic)float planetDayLength;
@property (nonatomic)int planetNumberOfMoon;
@property (nonatomic)float planetTemperature;
@property (strong, nonatomic)NSString *planetNickName;
@property (strong, nonatomic)NSString *planetInterestingFact;

//
//#define PLANET_GRAVITY @"Acelleration of Gravity at Surface"
//#define PLANET_DIAMETER @"Planet Size"
//#define PLANET_YEAR_LENGTH @"Planet Year Length"
//#define PLANET_DAY_LENGTH @"Length of Day in Hours"
//#define PLANET_TEMPERATURE @"Planet Temperature"
//#define PLANET_NUMBER_OF_MOONS @"Number of Moons"
//#define PLANET_NICKNAME @"Planet Nickname"
//#define PLANET_INTERESTING_FACT @"Fact about the Planet"
//#define PLANET_IMAGE @"Image of the Planet"

-(id)initWithData: (NSDictionary *)data andImage: (UIImage *)image;

@end
