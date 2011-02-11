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
@synthesize fullname;
@synthesize date;
@synthesize avatar;
@synthesize avatarURL;
@synthesize via;

- (id) initWithDictionary:(NSDictionary*)dict {
	
	self.tweetID	= [dict objectForKey:@"id_str"];
	self.msg		= [dict objectForKey:@"text"];
	self.username	= [[dict objectForKey:@"user"] objectForKey:@"screen_name"];
	self.fullname	= [[dict objectForKey:@"user"] objectForKey:@"name"];
	self.date		= [dict objectForKey:@"created_at"];
	self.avatarURL	= [[dict objectForKey:@"user"] valueForKey:@"profile_image_url"];
	self.via		= [dict objectForKey:@"source"];
	
	[NSThread detachNewThreadSelector:@selector(bgThread:) toTarget:self withObject:dict];
	
	return self;
}

-(void)bgThread:(NSDictionary *)obj
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSURL *imageURL = [NSURL URLWithString:[[obj objectForKey:@"user"] valueForKey:@"profile_image_url"]];
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
