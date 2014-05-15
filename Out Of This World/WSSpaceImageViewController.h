//
//  WSSpaceImageViewController.h
//  Out Of This World
//
//  Created by Wouter Straver on 09-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSSpaceObject.h"
@interface WSSpaceImageViewController : UIViewController < UIScrollViewDelegate>


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView * imageView;
@property (strong, nonatomic) WSSpaceObject * spaceObject;

@end
