//
//  SoundManager.h
//  Geography Tutor
//
//  Created by Al Pascual on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>

#import "SoundDelegate.h"


@interface SoundManager : NSObject {

	NSMutableArray *sndQueue;
	BOOL bPlaying;
	UIImageView *overlay;
	
	id <SoundDelegate> soundDelegate;
}

@property(nonatomic, strong) NSMutableArray *sndQueue;
@property(nonatomic, strong) UIImageView *overlay;

@property (strong, nonatomic) id <SoundDelegate> soundDelegate;


- (void) LoadSound:(NSString*)pathSound:(NSString*)ofType;
- (void)LoadRandomSound:(NSString*)pathSound:(NSString*)ofType;

-(id)init;

-(id)initWithArray:(NSMutableArray *)arraySound;

-(void)addSoundToQueue:(NSString*)snd;

-(NSString*)getSoundFromQueue;

-(void)playQueue;
@end
