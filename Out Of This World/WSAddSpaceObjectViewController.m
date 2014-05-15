//
//  WSAddSpaceObjectViewController.m
//  Out Of This World
//
//  Created by Wouter Straver on 11-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import "WSAddSpaceObjectViewController.h"

@interface WSAddSpaceObjectViewController ()

@end

@implementation WSAddSpaceObjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    WSSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.delegate addSpaceObject:newSpaceObject];
}


-(WSSpaceObject *) returnNewSpaceObject
{
    WSSpaceObject * addedSpaceObject = [[WSSpaceObject alloc] init];
    addedSpaceObject.name = self.nameTextField.text;
    addedSpaceObject.nickname = self.nicknameTextField.text;
    addedSpaceObject.diameter = [self.diameterTextField.text floatValue];
    addedSpaceObject.numberofmoons = [self.numberofmoonsTextField.text intValue];
    addedSpaceObject.temperature = [self.temperatureTextField.text floatValue];
    addedSpaceObject.interestFact = self.interestingfactTextField.text;
    addedSpaceObject.SpaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
    return addedSpaceObject;
    
}





@end
