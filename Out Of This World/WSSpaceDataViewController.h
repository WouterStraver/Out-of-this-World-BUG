//
//  WSSpaceDataViewController.h
//  Out Of This World
//
//  Created by Wouter Straver on 09-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSSpaceObject.h"

@interface WSSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) WSSpaceObject *spaceObject;

@end
