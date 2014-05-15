//
//  WSTableViewController.h
//  Out Of This World
//
//  Created by Wouter Straver on 04-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSAddSpaceObjectViewController.h"

@interface WSTableViewController : UITableViewController <WSAddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObject;

@end
