//
//  WSSpaceObject.m
//  Out Of This World
//
//  Created by Wouter Straver on 04-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import "WSSpaceObject.h"
#import "AstronomicalData.h"

@implementation WSSpaceObject

//-(id)init
//{
//    self = [self initwithdata:nil andImage:nil];
//    return self;
//}

-(id) initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    
    self.name = data [PLANET_NAME];
    self.gravitationalForce = [data [PLANET_GRAVITY] floatValue];
    self.diameter = [data [PLANET_DIAMETER] floatValue];
    self.yearLength = [data [PLANET_YEAR_LENGTH]floatValue];
    self.dayLength = [data [PLANET_DAY_LENGTH]floatValue];
    self.temperature = [data [PLANET_TEMPERATURE] floatValue];
    self.numberofmoons = [data [PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data [PLANET_NICKNAME];
    self.interestFact = data [PLANET_INTERESTING_FACT];
    
    self.SpaceImage = image;
    return self;
}

@end
