//
//  CCAddPlanetViewController.h
//  Out Of This World
//
//  Created by Standard on 7/3/14.
//  Copyright (c) 2014 Standard Application. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCSpaceObject.h"

@protocol CCAddPlanetVCDelegate <NSObject>

@required

- (void)addPlanetObject: (CCSpaceObject *)planetObject;
- (void)didCancel;

@end



@interface CCAddPlanetViewController : UIViewController


@property (weak, nonatomic) id<CCAddPlanetVCDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interactingFactTextField;
- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)AddButton:(UIButton *)sender;

@end
