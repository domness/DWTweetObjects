//
//  DWTweet.h
//  Tweeterena
//
//  Created by Dominic Wroblewski on 14/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DWTweet : NSObject {
	
	NSString	* tweetID;
	NSString	* msg;
	NSString	* username;
	NSString	* fullname;
	NSDate		* date;
	NSImage		* avatar;
	NSString	* avatarURL;
	NSString	* via;
	NSString	* longitude1;
	NSString	* latitude1;
	NSString	* longitude2;
	NSString	* latitude2;
	NSString	* longitude3;
	NSString	* latitude3;
	NSString	* longitude4;
	NSString	* latitude4;

}

@property (assign) NSString * tweetID;
@property (assign) NSString * msg;
@property (assign) NSString * username;
@property (assign) NSString * fullname;
@property (assign) NSDate	* date;
@property (assign) NSImage  * avatar;
@property (assign) NSString * avatarURL;
@property (assign) NSString * via;
@property (assign) NSString * longitude1;
@property (assign) NSString * latitude1;
@property (assign) NSString * longitude2;
@property (assign) NSString * latitude2;
@property (assign) NSString * longitude3;
@property (assign) NSString * latitude3;
@property (assign) NSString * longitude4;
@property (assign) NSString * latitude4;

- (id) initWithDictionary:(NSDictionary*)dict;
- (NSImage *)imageFromUrl:(NSString*)url;

@end
