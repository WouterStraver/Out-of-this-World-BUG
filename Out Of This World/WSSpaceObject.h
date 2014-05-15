//
//  WSSpaceObject.h
//  Out Of This World
//
//  Created by Wouter Straver on 04-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberofmoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;
//from my self

@property (strong, nonatomic) UIImage *SpaceImage;




-(id)initWithData:(NSDictionary *)data andImage: (UIImage *)image;



@end
