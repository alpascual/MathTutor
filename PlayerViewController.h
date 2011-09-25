//
//  PlayerViewController.h
//  MathTutor
//
//  Created by Albert Pascual on 9/22/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kID @"id"
#define kUsername @"username"
#define kSchool @"school"
#define kScore @"score"

@interface PlayerViewController : UIViewController
{
    UITextField *textUsername;
    UITextField *textSchool;
    
    UILabel *labelScore;
    NSString *myGuid;
}

@property (nonatomic, retain) IBOutlet UITextField *textUsername;
@property (nonatomic, retain) IBOutlet UITextField *textSchool;

@property (nonatomic, retain) IBOutlet UILabel *labelScore;
@property (nonatomic, retain) NSString *myGuid;

-(IBAction)savePressed:(id)sender;
- (NSString*) stringWithUUID;
- (IBAction)closedPress:(id)sender;

@end
