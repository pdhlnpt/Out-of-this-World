//
//  CCSpaceObject.m
//  Out Of This World
//
//  Created by Standard on 7/2/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCSpaceObject.h"
#import "AstronomicalData.h"

@implementation CCSpaceObject

-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self.planetName = data[PLANET_NAME];
    self.planetDiameter = [data[PLANET_DIAMETER] floatValue];
    self.planetGravity = [data[PLANET_GRAVITY]floatValue];
    self.planetYearLength = [data[PLANET_YEAR_LENGTH]floatValue];
    self.planetDayLength = [data[PLANET_DAY_LENGTH]floatValue];
    self.planetNumberOfMoon = [data[PLANET_NUMBER_OF_MOONS]intValue];
    self.planetTemperature = [data[PLANET_TEMPERATURE]floatValue];
    self.planetNickName = data[PLANET_NICKNAME];
    self.planetInterestingFact = data[PLANET_INTERESTING_FACT];
    self.planetImage = image;
    
    return self;
}

@end
