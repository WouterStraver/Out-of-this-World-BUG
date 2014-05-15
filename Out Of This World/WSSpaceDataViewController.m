//
//  WSSpaceDataViewController.m
//  Out Of This World
//
//  Created by Wouter Straver on 09-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import "WSSpaceDataViewController.h"

@interface WSSpaceDataViewController ()

@end

@implementation WSSpaceDataViewController

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
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
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

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text =@"Nickname :";
            cell.detailTextLabel.text =self.spaceObject.nickname;
            break;
        case 1:
            cell.textLabel.text = @"Diameter (km): ";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.diameter];
            break;
        case 2:
            cell.textLabel.text =@"Gravitationalforce";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravitationalForce];
            break;
        case 3:
            cell.textLabel.text = @"Length of year (in days)";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.yearLength];
            break;
        case 4:
            cell.textLabel.text = @"Length of day (in hours)";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temperature (in celcius)";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of moons";
            cell.detailTextLabel.text =  [NSString stringWithFormat:@"%i", self.spaceObject.numberofmoons];
            break;
        case 7:
            cell.textLabel.text = @"Interesting fact";
            cell.detailTextLabel.text = self.spaceObject.interestFact;
            break;
        default:
            break;
    }
    
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}




@end




















