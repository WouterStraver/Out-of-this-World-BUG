//
//  WSAddSpaceObjectViewController.h
//  Out Of This World
//
//  Created by Wouter Straver on 11-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSSpaceObject.h"

@protocol WSAddSpaceObjectViewControllerDelegate <NSObject>

@required
-(void)addSpaceObject: (WSSpaceObject *)SpaceObject;
-(void)didCancel;

@end



@interface WSAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <WSAddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberofmoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingfactTextField;

//buttons

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;


@end
