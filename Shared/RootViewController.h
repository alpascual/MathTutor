//
//  RootViewController.h
//  MathTutor
//
//  Created by Albert Pascual on 10/9/11.
//  Copyright (c) 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartScreenController.h"

@interface RootViewController : UIViewController
{
    StartScreenController *startController;
    
}

@property (nonatomic, retain) StartScreenController *startController;


- (IBAction) startCalled;

@end
