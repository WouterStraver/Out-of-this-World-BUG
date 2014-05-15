//
//  WSTableViewController.m
//  Out Of This World
//
//  Created by Wouter Straver on 04-05-14.
//  Copyright (c) 2014 Wouter Straver. All rights reserved.
//

#import "WSTableViewController.h"
#import "AstronomicalData.h"
#import "WSSpaceObject.h"
#import "WSSpaceImageViewController.h"
#import "WSTableViewController.h"
#import "WSSpaceDataViewController.h"
@interface WSTableViewController ()

@end

@implementation WSTableViewController
#define ADDED_SPACE_OBJECT_KEY @"Added space objects array"

-(NSMutableArray *)planets
{
    if (!_planets){
        _planets= [[NSMutableArray alloc] init];
        
    }
    return _planets;
    
}
-(NSMutableArray *)addedSpaceObject
{
    if (!_addedSpaceObject) {
        _addedSpaceObject = [[NSMutableArray alloc] init];
    }
    return _addedSpaceObject;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData [PLANET_NAME]];
        WSSpaceObject * planet= [[WSSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
        
        NSArray *myPlanetsAsPropertyList= [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECT_KEY];
        
        for (NSDictionary *dictionary in myPlanetsAsPropertyList){
            WSSpaceObject*spaceObject = [self spaceObjectForDictionary:dictionary];
            [self.addedSpaceObject addObject:spaceObject];
            
            
        }
        
    }
    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    NSString *firstcolor =@"Red";
//    
//    [myDictionary setObject:firstcolor forKey:@"Firetruck Color"];
//    [myDictionary setObject:@"Yellow" forKey:@"Star Color"];
//    [myDictionary setObject:@"blue" forKey:@"Ocean Color"];
//    NSLog(@"%@", myDictionary);
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WSAddSpaceObjectViewController Delegate
-(void) addSpaceObject:(WSSpaceObject *)SpaceObject
{
    
    
    //////klopt
    [self.addedSpaceObject addObject: SpaceObject ];
    
    //will save object to NSUserDefault
    NSMutableArray *spaceObjectsAsPropertyList =[[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECT_KEY] mutableCopy];
    if (!spaceObjectsAsPropertyList) spaceObjectsAsPropertyList =
        [[NSMutableArray alloc] init];
        
    [spaceObjectsAsPropertyList addObject:[ self SpaceObjectAsAPropertyList:SpaceObject]];
    
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertyList forKey:ADDED_SPACE_OBJECT_KEY];
     
     [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

-(void) didCancel
{
    NSLog(@"did Cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helper Methods

-(NSDictionary *)SpaceObjectAsAPropertyList:(WSSpaceObject *)spaceObject
{   NSData *imageData = UIImagePNGRepresentation(spaceObject.SpaceImage);
    NSDictionary *dictionary = @{PLANET_NAME: spaceObject.name, PLANET_NICKNAME: spaceObject.nickname, PLANET_GRAVITY: @(spaceObject.gravitationalForce), PLANET_DIAMETER: @(spaceObject.diameter), PLANET_YEAR_LENGTH: @(spaceObject.yearLength), PLANET_DAY_LENGTH: @(spaceObject.dayLength), PLANET_NUMBER_OF_MOONS: @(spaceObject.numberofmoons), PLANET_TEMPERATURE: @(spaceObject.temperature), PLANET_INTERESTING_FACT: spaceObject.interestFact, PLANET_IMAGE: imageData};
    return dictionary;
}

-(WSSpaceObject *)spaceObjectForDictionary:(NSDictionary *) dictionary
{   NSData *dataForImage = dictionary[PLANET_IMAGE];
    UIImage *spaceObjectImage = [UIImage imageWithData:dataForImage];
    
    WSSpaceObject *spaceObject = [[WSSpaceObject alloc] initWithData:dictionary andImage:spaceObjectImage];
    return spaceObject;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if ([self.addedSpaceObject count] > 0) {
        return 2;
    }
    else{
        return 1;
    }
    
}
//moet in een tableview.. sections niet verplicht.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    if (section ==1) {
        int test = [self.addedSpaceObject count];
        NSLog(@"%i", test);
        return [self.addedSpaceObject count];
    }
    else {
        return [self.planets count];
    }
   
}

//dit moet in een tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 1) {
        //use for configure the spaceObject cell
        WSSpaceObject *planet = [self.addedSpaceObject objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.SpaceImage;
        
        
    }
    
    else {
        WSSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.SpaceImage;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{   if(indexPath.section==1) return YES;
    
    else return NO;
    
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.addedSpaceObject removeObjectAtIndex:indexPath.row];
        
        NSMutableArray* newSavedSelectedData =[[NSMutableArray alloc] init];
        for (WSSpaceObject *spaceObject in self.addedSpaceObject){
            [newSavedSelectedData addObject: [self SpaceObjectAsAPropertyList:spaceObject]];
            
        }
        [[NSUserDefaults standardUserDefaults] setObject:newSavedSelectedData forKey:ADDED_SPACE_OBJECT_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //eror voorkomen door section te verwijderen wanneer er geen elementen meer over zijn..
        if (newSavedSelectedData.count >0 ) {
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        else {
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[WSSpaceImageViewController class]]) {
            WSSpaceImageViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            WSSpaceObject *selectedObject;
            if (path.section == 0 ) {
                selectedObject = self.planets[path.row];
            }
            else if (path.section == 1){
                selectedObject = self.addedSpaceObject[path.row];
            }
            
            nextViewController.spaceObject = selectedObject;
        }
    }
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[WSSpaceDataViewController class]]) {
            WSSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path =sender;
            WSSpaceObject *selectedObject;
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
            }
            else if (path.section == 1){
                selectedObject = self.addedSpaceObject[path.row];
            }
            
             targetViewController.spaceObject = selectedObject;
            
        }
    }
    if ([segue.destinationViewController isKindOfClass:[WSAddSpaceObjectViewController class]]){
        WSAddSpaceObjectViewController *addSpaceObjectVS =segue.destinationViewController;
        addSpaceObjectVS.delegate = self;
    }
}












@end
