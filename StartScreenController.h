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

@property (nonatomic, retain) PlayController *myplay;
@property (nonatomic,retain) SoundManager *sounds;
@property (nonatomic, retain) PlayerViewController *play;
@property (nonatomic, retain) ScoreTableList *scoreView;

-(IBAction) divisionButton;
-(IBAction) multiplicationButton;
-(IBAction) addingButton;
-(void) startGame:(NSString*)myType;
-(IBAction)setupPlayerPressed:(id)sender;
-(IBAction)scoreBoard:(id)sender;
@end
