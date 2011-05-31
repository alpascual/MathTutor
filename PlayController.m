    //
//  PlayController.m
//  MathTutor
//
//  Created by Albert Pascual on 2/28/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "PlayController.h"


@implementation PlayController

@synthesize firstNumber, secondNumber, theSign, theResult, firstAnswer, secondAnswer, thirdAnswer, theScore;
@synthesize playType;
@synthesize doneButton;
@synthesize answerFirstButton, answerSecondButton, answerThirdButton;
@synthesize nextButton, sounds;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil playType:(NSString *)mytype{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		
		self.playType = mytype;
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.answerFirstButton.hidden = YES;
	self.answerSecondButton.hidden = YES;
	self.answerThirdButton.hidden = YES;
    	
	self.sounds = [[SoundManager alloc] init];
	self.sounds.soundDelegate = self;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	
	[self.sounds release];
}

- (IBAction) donePressed
{
	
}

-(IBAction) buttonA
{
	if ( resultPos == 0 )
	{
		score = score + 1;
		[self.sounds LoadRandomSound:@"yes":@"wav"];
	}
	else
	{
		score = score - 1;
		[self.sounds LoadRandomSound:@"no":@"wav"];
	}
	
	[self answered];
}
-(IBAction) buttonB
{
	if ( resultPos == 1 )
	{
		score = score + 1;
		[self.sounds LoadRandomSound:@"yes":@"wav"];
	}
	else
	{
		score = score - 1;
		[self.sounds LoadRandomSound:@"no":@"wav"];
	}
	
	[self answered];
}
-(IBAction) buttonC
{
	if ( resultPos == 2 )
	{
		score = score + 1;
		[self.sounds LoadRandomSound:@"yes":@"wav"];
	}
	else
	{
		score = score - 1;
		[self.sounds LoadRandomSound:@"no":@"wav"];
	}
	
	[self answered];
}

- (void) answered
{
	self.nextButton.hidden = NO;
	self.theScore.text = [[NSString alloc] initWithFormat:@"Score: %d", score ];
}

-(IBAction) nextPressed
{
	self.nextButton.hidden = YES;
	
	[self loopStart];
}

- (void) start
{
	score = 0;	
	
	if ( [self.playType isEqualToString:@"adding"] )
	{
		theSign.text = @"+";	
	}
	else if ( [self.playType isEqualToString:@"multiplication"] )
	{
		theSign.text = @"X";
	}
	else if ( [self.playType isEqualToString:@"minus"] )
	{
		theSign.text = @"-";
	}
	
	[self loopStart];
}

- (void) loopStart
{
	self.answerFirstButton.hidden = YES;
	self.answerSecondButton.hidden = YES;
	self.answerThirdButton.hidden = YES;
	
	[self.sounds addSoundToQueue:@"what"];
    [self.sounds addSoundToQueue:@"none"];
    [self.sounds addSoundToQueue:@"none"];
	
	self.nextButton.hidden = YES;
	
	int ran1 = 0;
	ran1 = arc4random() % 30;
	
	int ran2 = 0;
	ran2 = arc4random() % 30;
	
	resultPos = arc4random() % 2;
	
	[self.sounds addSoundToQueue:[[NSString alloc] initWithFormat:@"%d", ran1 ]];
    [self.sounds addSoundToQueue:@"none"];
	int iResult = 0;
	if ( [self.playType isEqualToString:@"adding"] )
	{
		iResult = ran1 + ran2;	
		[self.sounds addSoundToQueue:@"plus"];
	}
	else if ( [self.playType isEqualToString:@"multiplication"] )
	{
		iResult = ran1 * ran2;
		[self.sounds addSoundToQueue:@"times"];
	}
	else if ( [self.playType isEqualToString:@"minus"] )
	{
		while (ran1 < ran2) {
			ran1 = ran1 + 1;
		}
		iResult = ran1 - ran2;
		[self.sounds addSoundToQueue:@"minus"];
	}
	
    [self.sounds addSoundToQueue:@"none"];
	[self.sounds addSoundToQueue:[[NSString alloc] initWithFormat:@"%d", ran2 ]];
	
	// Connect them
	firstNumber.text = [[NSString alloc] initWithFormat:@"%d", ran1 ];
	secondNumber.text = [[NSString alloc] initWithFormat:@"%d", ran2];
	
	if ( resultPos == 0 )
	{
		firstAnswer.text = [[NSString alloc] initWithFormat:@"A = %d", iResult];
		secondAnswer.text = [[NSString alloc] initWithFormat:@"B = %d", [self makeSureNotDuplicate:iResult]];
		thirdAnswer.text = [[NSString alloc] initWithFormat:@"C = %d", iResult + arc4random() % 10];
	}
	if ( resultPos == 1 )
	{
		secondAnswer.text = [[NSString alloc] initWithFormat:@"B = %d", iResult];
		firstAnswer.text = [[NSString alloc] initWithFormat:@"A = %d", [self makeSureNotDuplicate:iResult]];
		thirdAnswer.text = [[NSString alloc] initWithFormat:@"C = %d", iResult + arc4random() % 10];
	}
	if ( resultPos == 2 )
	{
		thirdAnswer.text = [[NSString alloc] initWithFormat:@"C = %d", iResult];
		firstAnswer.text = [[NSString alloc] initWithFormat:@"A = %d", [self makeSureNotDuplicate:iResult]];
		secondAnswer.text = [[NSString alloc] initWithFormat:@"B = %d", iResult + arc4random() % 10];
	}
	
	[self.sounds playQueue];
}

- (int) makeSureNotDuplicate:(int) iResult
{
    int myRandom = arc4random() % 50;
    if ( myRandom == iResult )
        myRandom = myRandom + 1;
    
    return myRandom;
}

// Called from Sound Delegate if set up
- (void) finish
{
	NSLog(@"Sound finished, enable everything again");
	
	self.answerFirstButton.hidden = NO;
	self.answerSecondButton.hidden = NO;
	self.answerThirdButton.hidden = NO;
	
}

@end
