//
//  MyProf.h
//  Tweeterena
//
//  Created by Dominic Wroblewski on 03/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DWPerson : NSObject {
	
	NSString *username;
	NSString *realName;
	NSString *latestTweet;
	NSString *imageUrl;
	NSString *location;
	NSString *description;
	NSString *url;
	NSString *noFollowers;
	NSString *noFollowing;
	
}


- (DWPerson *)initWithUser:(NSString*)username;
- (DWPerson *)initWithUserInfo:(NSDictionary*)info;

- (void)setUsername:(NSString*)username;
- (NSString *)getUsername;
- (void)setRealName:(NSString*)username;
- (NSString *)getRealName;
- (void)setLocation:(NSString*)loc;
- (NSString *)getLocation;
- (void)setDescription:(NSString*)desc;
- (NSString *)getDescription;
- (void)setURLi:(NSString*)URL;
- (NSString *)getURLi;
- (void)setFollowers:(NSString*)followers;
- (NSString *)getFollowers;
- (void)setFollowing:(NSString*)following;
- (NSString *)getFollowing;
- (void)setImageUrl:(NSString*)imageStr;
- (NSString *)getImageUrl;

@end
