//
//  SoundEffectHelper.m
//  SoundEffectDemo
//
//  Created by Freshman on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundEffectHelper.h"

#import <AudioToolbox/AudioToolbox.h>

#import <AVFoundation/AVFoundation.h>

@interface SoundEffectHelper()
@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation SoundEffectHelper 

+ (void)playSFX 
{
    SystemSoundID soundID;
    
    // get the filepath from filename.
    NSString* soundPath = [[NSBundle mainBundle] pathForResource:@"sfx" ofType:@"wav"];
    
    // create CFURLRef from the path, which we will use for AudioServices
    CFURLRef soundFileRef = (CFURLRef)CFBridgingRetain([[NSURL alloc] initFileURLWithPath:soundPath]);
    
    AudioServicesCreateSystemSoundID(soundFileRef, &soundID);
    
    AudioServicesPlaySystemSound(soundID);
}

- (void)playSFXByAudioPlayer
{
    NSString* soundPath = [[NSBundle mainBundle] pathForResource:@"sfx" ofType:@"wav"];
    
    NSURL *url = [NSURL fileURLWithPath:soundPath];
    NSLog(@"%@", url);
    
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
//    if (error)
    {
        NSLog(@"%@", error);
    }
    
    // prevent the AudioPlayer interruping the iPod music playing.
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    [self.player play];
}

+ (void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
