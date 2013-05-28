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

@property (nonatomic,strong) NSString *playType;
@property (nonatomic,strong) IBOutlet UILabel *firstNumber;
@property (nonatomic,strong) IBOutlet UILabel *secondNumber;
@property (nonatomic,strong) IBOutlet UILabel *theSign;
@property (nonatomic,strong) IBOutlet UILabel *theResult;
@property (nonatomic,strong) IBOutlet UILabel *firstAnswer;
@property (nonatomic,strong) IBOutlet UILabel *secondAnswer;
@property (nonatomic,strong) IBOutlet UILabel *thirdAnswer;
@property (nonatomic,strong) IBOutlet UILabel *theScore;
@property (nonatomic,strong) IBOutlet UIButton *answerFirstButton;
@property (nonatomic,strong) IBOutlet UIButton *answerSecondButton;
@property (nonatomic,strong) IBOutlet UIButton *answerThirdButton;
@property (nonatomic,strong) IBOutlet UIButton *nextButton;
@property (nonatomic,strong) IBOutlet UIImageView *sadOne;
@property (nonatomic,strong) IBOutlet UIImageView *sadTwo;
@property (nonatomic,strong) IBOutlet UIImageView *sadThree;

@property (nonatomic,strong) IBOutlet UIBarButtonItem *doneButton;

@property (nonatomic,strong) SoundManager *sounds;


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
