//
//  RootViewController.m
//  MathTutor
//
//  Created by Albert Pascual on 10/9/11.
//  Copyright (c) 2011 Al. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize startController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) startCalled
{
	
	// iAds requires a View instead of a Window
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		self.startController = [[[StartScreenController alloc] initWithNibName:@"iPadStartScreenController" bundle:nil] autorelease];
		
		self.startController.modalPresentationStyle = UIModalPresentationFullScreen;
		self.startController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		
        [self presentModalViewController:self.startController animated:YES];
		
		
	}
	else
	{
		self.startController = [[[StartScreenController alloc] initWithNibName:@"iPhoneStartScreenController" bundle:nil] autorelease];
		
        if ( self.navigationController == nil )
        {
            /*self.navigationController set [[UINavigationController alloc] initWithRootViewController:self];*/
        }
		
        [self.navigationController pushViewController:self.startController animated:YES];		
	}
}

@end
