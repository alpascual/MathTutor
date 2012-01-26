//
//  PlayerViewController.m
//  MathTutor
//
//  Created by Albert Pascual on 9/22/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "PlayerViewController.h"

@implementation PlayerViewController

@synthesize textSchool, textUsername, labelScore;
@synthesize myGuid;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    
    
     NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults];
    
    if ( [myPrefs stringForKey:kID] != nil )
    {
        // read the time and set it
        if ( [myPrefs valueForKey:kUsername] != nil )
        {
            self.textUsername.text = [myPrefs valueForKey:kUsername];
            
            self.textSchool.text = [myPrefs valueForKey:kSchool];
            
            if ( [myPrefs valueForKey:kScore] != nil )
                self.labelScore.text = [[[NSString alloc] initWithFormat:@"Score %@", [myPrefs valueForKey:kScore]]autorelease];
            else
                self.labelScore.text = @"Score 0";
            
            NSString *myScore = [myPrefs valueForKey:kScore];
            myGuid = [myPrefs valueForKey:kID];
            
            NSString *myRequestString = [[[NSString alloc] initWithFormat:@"http://score.alsandbox.us/Home/Score?ID=%@&Score=%@&app=math", myGuid, myScore] autorelease];
            
            NSURL *urlToOpen = [[NSURL alloc] initWithString:myRequestString];
            
            NSURLRequest *aReq = [NSURLRequest requestWithURL:urlToOpen];
            
            NSData *response = [NSURLConnection sendSynchronousRequest:aReq returningResponse:nil error:nil];
            NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
            
            NSLog(@"request replied %@", get );
            
        }
        
    }
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

-(IBAction)savePressed:(id)sender
{
    NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults];
    //Update only
    if ( [myPrefs stringForKey:kID] != nil ||  self.myGuid != nil)
    {
        // http://score.alsandbox.us/UpdateUser?ID=1234567890&Username=al&School=Franklin&app=math
        
        if ( [myPrefs stringForKey:kID] != nil)
            self.myGuid = [myPrefs valueForKey:kID];
        
        [myPrefs setValue:self.textUsername.text forKey:kUsername];
        [myPrefs setValue:self.textSchool.text forKey:kSchool];
        
        NSString *myRequestString = [[NSString alloc] initWithFormat:@"http://score.alsandbox.us/Home/UpdateUser?ID=%@&Username=%@&School=%@&app=math", myGuid, self.textUsername.text, self.textSchool.text];
        
        NSURL *urlToOpen = [[NSURL alloc] initWithString:myRequestString];
        
        NSURLRequest *aReq = [NSURLRequest requestWithURL:urlToOpen];
        
        NSData *response = [NSURLConnection sendSynchronousRequest:aReq returningResponse:nil error:nil];
        NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        
        NSLog(@"request replied %@", get );
    }
    
    // Create for the first time
    else
    {
        // http://score.alsandbox.us/CreateUser?ID=1234567890&Username=al&School=Franklin&Score=1&app=math
        self.myGuid = [self stringWithUUID];
        //self.myGuid = [[NSString alloc] initWithFormat:@"1234"];
        
        // save it first in the strings
        [myPrefs setValue:myGuid forKey:kID];
        [myPrefs setValue:self.textUsername.text forKey:kUsername];
        [myPrefs setValue:self.textSchool.text forKey:kSchool];        
        
        NSString *myRequestString = [[NSString alloc] initWithFormat:@"score.alsandbox.us/Home/CreateUser?ID=%@&Username=%@&School=%@&Score=0&app=math", myGuid, self.textUsername.text, self.textSchool.text];
        
        NSLog(@"%@", myRequestString);
        
        //myRequestString = [myRequestString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString * escapedUrlString =
        (NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                            NULL,
                                                            (CFStringRef)myRequestString,
                                                            NULL,
                                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                            kCFStringEncodingUTF8 );
              
        NSLog(@"%@", escapedUrlString);
        
        NSURL *urlToOpen = [[NSURL alloc] initWithString:escapedUrlString];
        
        NSURLRequest *aReq = [NSURLRequest requestWithURL:urlToOpen];
        
        NSData *response = [NSURLConnection sendSynchronousRequest:aReq returningResponse:nil error:nil];
        NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        
        NSLog(@"request replied %@", get );
        
        [myRequestString release];
        [escapedUrlString release];
        
    }
    
    // How to updat score?
    //http://score.alsandbox.us/Score?ID=1234567890&Score=1&app=math
    
     if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
     {
         [self dismissModalViewControllerAnimated:YES];
     }
    
}

- (NSString*) stringWithUUID {
    CFUUIDRef	uuidObj = CFUUIDCreate(nil);//create a new UUID
    //get the string representation of the UUID
    NSString	*uuidString = (NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return [uuidString autorelease];
}

- (IBAction)closedPress:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
