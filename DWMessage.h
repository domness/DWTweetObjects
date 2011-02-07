//
//  DWMessage.h
//  Tweeterena
//
//  Created by Dominic Wroblewski on 14/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DWMessage : NSObject {
	
	NSString	* tweetID;
	NSString	* msg;
	NSString	* username;
	NSString	* fullname;
	NSDate		* date;
	NSImage		* avatar;
	NSString	* avatarURL;
	
	NSString	* recipient;

}

@property (assign) NSString * tweetID;
@property (assign) NSString * msg;
@property (assign) NSString * username;
@property (assign) NSString * fullname;
@property (assign) NSDate	* date;
@property (assign) NSImage  * avatar;
@property (assign) NSString * avatarURL;

@property (assign) NSString * recipient;

- (id) initWithDictionary:(NSDictionary*)dict;
- (NSImage *)imageFromUrl:(NSString*)url;

@end
