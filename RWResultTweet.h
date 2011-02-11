//
//  RWResultTweet.h
//  Tweeterena
//
//  Created by Robert White on 08/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RWResultTweet : NSObject {
	
	NSString	* tweetID;
	NSString	* msg;
	NSString	* username;
	NSString	* fullname;
	NSDate		* date;
	NSImage		* avatar;
	NSString	* avatarURL;
	NSString	* via;
	
}

@property (assign) NSString * tweetID;
@property (assign) NSString * msg;
@property (assign) NSString * username;
@property (assign) NSString * fullname;
@property (assign) NSDate	* date;
@property (assign) NSImage  * avatar;
@property (assign) NSString * avatarURL;
@property (assign) NSString * via;

- (id) initWithDictionary:(NSDictionary*)dict;
- (NSImage *)imageFromUrl:(NSString*)url;

@end