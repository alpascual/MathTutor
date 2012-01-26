//
//  AppDelegate_Shared.h
//  MathTutor
//
//  Created by Albert Pascual on 2/28/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "StartScreenController.h"


@class RootViewController;


@interface AppDelegate_Shared : UIResponder <UIApplicationDelegate> {
    
    UIWindow *window;
    
	StartScreenController *startController;
	
    
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (strong, nonatomic) RootViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;


@end

