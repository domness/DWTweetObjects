//
//  RWResultTweet.m
//  Tweeterena
//
//  Created by Robert White on 08/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import "RWResultTweet.h"


@implementation RWResultTweet

@synthesize tweetID;
@synthesize msg;
@synthesize username;
@synthesize date;
@synthesize avatar;
@synthesize avatarURL;
@synthesize via;
@synthesize from_user_id_str;
@synthesize to_user_id_str;

- (id) initWithDictionary:(NSDictionary*)dict {
	
	if ([dict objectForKey:@"completed_in"]) {
		self.tweetID = @"";
		self.msg = @"";
		self.username = @"";
		self.from_user_id_str = @"";
		self.to_user_id_str = @"";
		self.date = nil;
		self.via = @"";
		self.avatarURL = @"";
	}else {
		self.tweetID			= [dict objectForKey:@"id_str"];
		self.msg				= [dict objectForKey:@"text"];
		self.username			= [dict objectForKey:@"from_user"];
		self.from_user_id_str	= [dict objectForKey:@"from_user_id_str"];
		self.to_user_id_str		= [dict objectForKey:@"to_user_id_str"];
		self.date				= [dict objectForKey:@"created_at"];
		self.via				= [dict objectForKey:@"source"];
		
		if ([dict objectForKey:@"profile_image_url"]) {
			if ([dict objectForKey:@"profile_image_url"] != [NSNull null]) {
				self.avatarURL	= [dict objectForKey:@"profile_image_url"];
				[NSThread detachNewThreadSelector:@selector(bgThread:) toTarget:self withObject:dict];
			}else {
				self.avatarURL = @"";
			}
		}else {
			self.avatarURL = @"";
		}

		
	}

	

	
	
	return self;
}

-(void)bgThread:(NSDictionary *)obj
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSURL *imageURL = [NSURL URLWithString:self.avatarURL];
	NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
	NSImage *image = [[NSImage alloc] initWithData:imageData];
	
	self.avatar = image;
	
	[self performSelectorOnMainThread:@selector(bgThreadIsDone:) withObject:nil waitUntilDone:NO];
	[pool release];
	
}

- (void)bgThreadIsDone:(id)obj
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"reload_table" object:nil];
}

- (NSImage *)imageFromUrl:(NSString*)url {
	if (url) {
		NSURL *imageURL = [NSURL URLWithString:url];
		NSImage *image = [[[NSImage alloc] initWithData:[NSData dataWithContentsOfURL:imageURL]] autorelease];
		return image;
	}
	return nil;
	
	
}

@end
