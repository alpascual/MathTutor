//
//  StartScreenController.h
//  MathTutor
//
//  Created by Albert Pascual on 2/28/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayController.h"
#import "SoundManager.h"
#import <iAd/iAd.h>

#import "PlayerViewController.h"
#import "ScoreTableList.h"


@interface StartScreenController : UIViewController {

	PlayController *myplay;
	
	SoundManager *sounds;
    
    PlayerViewController *play;
    ScoreTableList *scoreView;
	
}

@property (nonatomic, strong) PlayController *myplay;
@property (nonatomic,strong) SoundManager *sounds;
@property (nonatomic, strong) PlayerViewController *play;
@property (nonatomic, strong) ScoreTableList *scoreView;

-(IBAction) divisionButton;
-(IBAction) multiplicationButton;
-(IBAction) addingButton;
-(void) startGame:(NSString*)myType;
-(IBAction)setupPlayerPressed:(id)sender;
-(IBAction)scoreBoard:(id)sender;
@end
