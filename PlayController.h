//
//  PlayController.h
//  MathTutor
//
//  Created by Albert Pascual on 2/28/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SoundManager.h"
#import "SoundDelegate.h"


@interface PlayController : UIViewController <SoundDelegate> {

	NSString *playType;
	
	UILabel *firstNumber;
	UILabel *secondNumber;
	UILabel *theSign;
	UILabel *theResult;
	UILabel *firstAnswer;
	UILabel *secondAnswer;
	UILabel *thirdAnswer;
	UILabel *theScore;
	
	UIButton *answerFirstButton;
	UIButton *answerSecondButton;
	UIButton *answerThirdButton;
	
	UIBarButtonItem *doneButton;
	
	UIButton *nextButton;
	
	int resultPos;
	int score;
	
	SoundManager *sounds;
    int failed;
    
    UIImageView *sadOne;
    UIImageView *sadTwo;
    UIImageView *sadThree;
}

@property (nonatomic,retain) NSString *playType;
@property (nonatomic,retain) IBOutlet UILabel *firstNumber;
@property (nonatomic,retain) IBOutlet UILabel *secondNumber;
@property (nonatomic,retain) IBOutlet UILabel *theSign;
@property (nonatomic,retain) IBOutlet UILabel *theResult;
@property (nonatomic,retain) IBOutlet UILabel *firstAnswer;
@property (nonatomic,retain) IBOutlet UILabel *secondAnswer;
@property (nonatomic,retain) IBOutlet UILabel *thirdAnswer;
@property (nonatomic,retain) IBOutlet UILabel *theScore;
@property (nonatomic,retain) IBOutlet UIButton *answerFirstButton;
@property (nonatomic,retain) IBOutlet UIButton *answerSecondButton;
@property (nonatomic,retain) IBOutlet UIButton *answerThirdButton;
@property (nonatomic,retain) IBOutlet UIButton *nextButton;
@property (nonatomic,retain) IBOutlet UIImageView *sadOne;
@property (nonatomic,retain) IBOutlet UIImageView *sadTwo;
@property (nonatomic,retain) IBOutlet UIImageView *sadThree;

@property (nonatomic,retain) IBOutlet UIBarButtonItem *doneButton;

@property (nonatomic,retain) SoundManager *sounds;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil playType:(NSString *)mytype;

- (IBAction) donePressed;

-(IBAction) buttonA;
-(IBAction) buttonB;
-(IBAction) buttonC;

-(IBAction) nextPressed;

- (void) start;
- (void) loopStart;
- (void) answered;

- (int) makeSureNotDuplicate:(int) iResult;
- (void) checkSadFaces;



@end
