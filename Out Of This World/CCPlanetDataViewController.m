//
//  CCPlanetDataViewController.m
//  Out Of This World
//
//  Created by Standard on 7/3/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCPlanetDataViewController.h"

@interface CCPlanetDataViewController ()

@end

@implementation CCPlanetDataViewController

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

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"DataCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    cell.textLabel.text = [NSString stringWithFormat:@"row %i", indexPath.row];
//    cell.textLabel.text = @"Data";
    switch (indexPath.row) {
        
        case 0:
            cell.textLabel.text = @"Name:";
            cell.detailTextLabel.text = self.myPlanet.planetName;
            break;
        case 1:
            cell.textLabel.text = @"NickName:";
            cell.detailTextLabel.text = self.myPlanet.planetNickName;
            break;
        case 2:
            cell.textLabel.text = @"Diameter in km:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.myPlanet.planetDiameter];
            break;
        case 3:
            cell.textLabel.text = @"Gravitation Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.myPlanet.planetGravity];
            break;
        case 4:
            cell.textLabel.text = @"Length of a Year in Days:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.myPlanet.planetYearLength];
            break;
        case 5:
            cell.textLabel.text = @"Length of Day in hours:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.myPlanet.planetDayLength];
            break;
        case 6:
            cell.textLabel.text = @"Temperature in Celsius(C):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.myPlanet.planetTemperature];
            break;
        case 7:
            cell.textLabel.text = @"Number of Moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.myPlanet.planetNumberOfMoon];
            break;
        case 8:
            cell.textLabel.text = @"Interacting Fact:";
            cell.detailTextLabel.text = self.myPlanet.planetInterestingFact;
        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
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

@end
