    //
//  StartScreenController.m
//  MathTutor
//
//  Created by Albert Pascual on 2/28/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "StartScreenController.h"


@implementation StartScreenController

@synthesize myplay, sounds;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.sounds = [[SoundManager alloc] init];
	[self.sounds addSoundToQueue:@"welcome"];
	[self.sounds playQueue];
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


-(IBAction) divisionButton
{
	[self startGame:@"minus"];
}
-(IBAction) multiplicationButton
{
	[self startGame:@"multiplication"];
}
-(IBAction) addingButton
{
	[self startGame:@"adding"];
}

-(void) startGame:(NSString*)myType
{
	// iAds requires a View instead of a Window
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		self.myplay = [[[PlayController alloc] initWithNibName:@"iPadPlayController" bundle:nil playType:myType] autorelease];
		self.myplay.modalPresentationStyle = UIModalPresentationFullScreen;
		self.myplay.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:self.myplay animated:YES];
		
	}
	else {
		
		self.myplay = [[[PlayController alloc] initWithNibName:@"iPhonePlayController" bundle:nil playType:myType] autorelease];
		[self.navigationController pushViewController:self.myplay animated:YES]; 
	} 
		
	[self.myplay start];

}

@end
