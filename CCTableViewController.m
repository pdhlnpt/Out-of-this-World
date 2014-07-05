//
//  CCTableViewController.m
//  Out Of This World
//
//  Created by Standard on 7/2/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCTableViewController.h"
#import "CCSpaceObject.h"
#import "AstronomicalData.h"
#import "CCPlanetImageViewController.h"
#import "CCPlanetDataViewController.h"

@interface CCTableViewController ()

@end

@implementation CCTableViewController
#define ADDED_SPACE_OBJECT_KEY @"Added Space Object Array"

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
    self.planets = [[NSMutableArray alloc]init];
//    NSString *planet1 = @"Mecurry";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mar";
//    NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
////        [self.planets addObject:planet1];
////        [self.planets addObject:planet2];
////        [self.planets addObject:planet3];
////        [self.planets addObject:planet4];
////        [self.planets addObject:planet5];
////        [self.planets addObject:planet6];
////        [self.planets addObject:planet7];
////        [self.planets addObject:planet8];
//    self.planets =[[NSMutableArray alloc]initWithObjects:planet1, planet2, planet3, planet4, planet5, planet6, planet7, planet8, nil];
//
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc]init];
//    NSString *firstColor = @"red";
//    [myDictionary setObject:firstColor forKey:@"fire Truck"];
//    [myDictionary setObject:@"blue" forKey:@"ocean color"];
//    [myDictionary setObject:@"yeallow" forKey:@"star Color"];
//    NSLog(@"%@", myDictionary);
//    NSString *bluestring = [myDictionary objectForKey:@"ocean color"];
////    NSLog(@"bluestring %@", bluestring);
//    NSNumber *mynumber = [[NSNumber alloc]initWithInt:5];
//    NSLog(@"number %@",mynumber);
//    NSNumber *myfloat = [NSNumber numberWithFloat:3.4];
//    NSLog(@"myfloat %@", myfloat);
//
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]){
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg",planetData[PLANET_NAME]];
        CCSpaceObject *planet = [[CCSpaceObject alloc]initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
        
    }
//    self.view.backgroundColor = [UIColor blackColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.translucent = NO;
////    self.navigationController.navigationItem.titleView.backgroundColor = [UIColor whiteColor];
//       self.navigationController.navigationItem.titleView. = [UIColor whiteColor];
    NSArray *myPlanetAsPropertyList = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECT_KEY];
    for (NSDictionary *dictinonary in myPlanetAsPropertyList) {
        CCSpaceObject *spaceObject = [self spaceObjectForDictionary:dictinonary];
        [self.addedPlanet addObject:spaceObject];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"sender is: %@", sender);
    if ([sender isKindOfClass:[UITableViewCell class]]){ //kiem tra sender có phải thuộc clash uitableviewcell hay ko. trong trường hợp có thể preparefor segue cho nhiều sự kiện khác nữa.
        if ([segue.destinationViewController isKindOfClass:[CCPlanetImageViewController class]]) {
            //kiểm tra xem segue trỏ đến viewcontroller đích có phải là thuộc class ccplanetimageviewcontroller hay ko .
            CCPlanetImageViewController *nextViewController = segue.destinationViewController;
            //khởi tạo 1 nextviewcontroller mới theo class plasnetImageViewcontroller và gán bằng viewcontroller đích của segue
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
//            khởi tạo 1 biến path để lưu giữ indexpath của cell hiện tại ( indexpath của sender (uitableviewcell)
            CCSpaceObject *selectedObject = [[CCSpaceObject alloc]init];//khởi tạo 1 đối tượng lưu trữ cell đc bấm.
            if (path.section == 1) {
                 selectedObject = self.addedPlanet[path.row];
            }//Nếu section bằng 1 thì đối tượng lựa chọn là mảng mà có chưa đối tượng vừa đc thêm.
            else {
                 selectedObject = self.planets[path.row];
            }//còn không thì sử dụng mảng mặc định để hiện nôi dung.
            
//            KHởi tạo selectedObject bằng cách lấy phần tử trong mảng planets.
            
            nextViewController.mySpaceObject = selectedObject;
//            gán giá trị của đối tượng mySpaceObject bằng với đối tượng selected Object ( truyền dữ liệu sang planetimageviewcontroller)
            nextViewController.myImage = selectedObject.planetImage;
        }
        
    }
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[CCPlanetDataViewController class]]){
            CCPlanetDataViewController *planetDataVC = segue.destinationViewController;
            NSIndexPath *path = sender;
            CCSpaceObject *selectedObject = [[CCSpaceObject alloc] init];
            if (path.section == 1) {
                selectedObject = self.addedPlanet[path.row];
            }
            else {
                selectedObject = self.planets[path.row];
            }
            
            planetDataVC.myPlanet = selectedObject;
            
        }
    }
    
    if ([segue.destinationViewController isKindOfClass:[CCAddPlanetViewController class]]){
        CCAddPlanetViewController *addPlanetVC = segue.destinationViewController;
        addPlanetVC.delegate = self;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if ([self.addedPlanet count]) {
        return 2;
    }
    else return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    if (section == 0) {
//        return 3;
//    }
//    else{
//        return 2;
//    }
    if (section == 1) {
        return  [self.addedPlanet count];
    }
    else {
        return [self.planets count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
//    cell.textLabel.text = @"cell's text";
//    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row];
//    cell.textLabel.text = [self.planets objectAtIndex:indexPath.row];
////    if (indexPath.section == 0){
////        cell.backgroundColor = [UIColor redColor];
////    }
////    else {
////        cell.backgroundColor = [UIColor greenColor];
////    }
//    cell.backgroundColor = [UIColor greenColor];
    
    if (indexPath.section == 1) {
        //Use new added Object to customize cell.
        CCSpaceObject *planet = self.addedPlanet[indexPath.row];
        cell.textLabel.text = planet.planetName;
        cell.detailTextLabel.text = planet.planetNickName;
        cell.imageView.image = planet.planetImage;
    }
    else {
        CCSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.planetName;
        cell.detailTextLabel.text = planet.planetNickName;
        cell.imageView.image = planet.planetImage;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"accessory %i tapped!", indexPath.row);
    [self performSegueWithIdentifier:@"PushToPlanetData" sender:indexPath];
}

#pragma mark - CCAddPlanetVC Delegate


- (void)addPlanetObject:(CCSpaceObject *)planetObject{
    if (!self.addedPlanet) {
        self.addedPlanet = [[NSMutableArray alloc]init
                            ];
    }
    [self.addedPlanet addObject:planetObject];
    
//    NSLog(@"Did addPlanet");
    //Will save to NSUserDefaults here
    
    NSMutableArray *spaceObjectAsPropertyList = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_SPACE_OBJECT_KEY] mutableCopy];
    if (!spaceObjectAsPropertyList) {
        spaceObjectAsPropertyList = [[NSMutableArray alloc]init];
    }
    
    [spaceObjectAsPropertyList addObject:[self spaceObjectAsPropertyList:planetObject]];
//    NSLog(@"%@", spaceObjectAsPropertyList);
    [[NSUserDefaults standardUserDefaults]setObject:spaceObjectAsPropertyList forKey:ADDED_SPACE_OBJECT_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}


- (void)didCancel{
    NSLog(@"Did Cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helper methods

- (NSDictionary *)spaceObjectAsPropertyList:(CCSpaceObject *)spaceObject{//hàm chuyển hoá Space Object thành spaceObjectProperty list
    NSData *imageData = UIImagePNGRepresentation(spaceObject.planetImage);
    NSDictionary *dictionary = @{PLANET_NAME : spaceObject.planetName,
                                 PLANET_NICKNAME : spaceObject.planetNickName,
                                 PLANET_GRAVITY : @(spaceObject.planetGravity),
                                 PLANET_DIAMETER : @(spaceObject.planetDiameter),
                                 PLANET_YEAR_LENGTH : @(spaceObject.planetYearLength),
                                 PLANET_DAY_LENGTH : @(spaceObject.planetDayLength),
                                 PLANET_TEMPERATURE : @(spaceObject.planetTemperature),
                                 PLANET_NUMBER_OF_MOONS : @(spaceObject.planetNumberOfMoon),
                                 PLANET_INTERESTING_FACT : spaceObject.planetInterestingFact,
                                 PLANET_IMAGE : imageData};
    
    return dictionary;
}

- (CCSpaceObject *)spaceObjectForDictionary: (NSDictionary *)dictionary{
    CCSpaceObject *spaceObject = [[CCSpaceObject alloc]initWithData:dictionary andImage:[UIImage imageNamed:@"einsteinRing.jpg"]];
    return spaceObject;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
