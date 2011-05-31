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

@interface AppDelegate_Shared : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
	StartScreenController *startController;
	UINavigationController *navigationController;
    
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) StartScreenController *startController;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

- (IBAction) startCalled;

@end

