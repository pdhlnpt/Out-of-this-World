//
//  CCAddPlanetViewController.m
//  Out Of This World
//
//  Created by Standard on 7/3/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import "CCAddPlanetViewController.h"

@interface CCAddPlanetViewController ()

@end

@implementation CCAddPlanetViewController

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

- (IBAction)cancelButton:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)AddButton:(UIButton *)sender {
    CCSpaceObject *newPlanetObject = [self returnNewPlanet];
    [self.delegate addPlanetObject:newPlanetObject];
}

- (CCSpaceObject *)returnNewPlanet
{
    CCSpaceObject *addedPlanet = [[CCSpaceObject alloc]init];
    addedPlanet.planetName = self.nameTextField.text;
    addedPlanet.planetNickName = self.nickNameTextField.text;
    addedPlanet.planetDiameter = [self.diameterTextField.text floatValue];
    addedPlanet.planetTemperature = [self.diameterTextField.text floatValue];
    addedPlanet.planetNumberOfMoon = [self.numberOfMoonsTextField.text intValue];
    addedPlanet.planetInterestingFact = self.interactingFactTextField.text;
    addedPlanet.planetImage = [UIImage imageNamed:@"EinsteinRing.jpg"];
      
    return addedPlanet;
}
@end
