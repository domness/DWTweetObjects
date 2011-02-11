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
	NSDate		* date;
	NSImage		* avatar;
	NSString	* avatarURL;
	NSString	* via;
	NSString	* from_user_id_str;
	NSString	* to_user_id_str;
	
}

@property (assign) NSString * tweetID;
@property (assign) NSString * msg;
@property (assign) NSString * username;
@property (assign) NSDate	* date;
@property (assign) NSImage  * avatar;
@property (assign) NSString * avatarURL;
@property (assign) NSString * via;
@property (assign) NSString * from_user_id_str;
@property (assign) NSString * to_user_id_str;

- (id) initWithDictionary:(NSDictionary*)dict;
- (NSImage *)imageFromUrl:(NSString*)url;

@end