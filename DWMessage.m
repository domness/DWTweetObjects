//
//  DWMessage.m
//  Tweeterena
//
//  Created by Dominic Wroblewski on 14/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "DWMessage.h"

@implementation DWMessage

@synthesize avatar;
@synthesize avatarURL;
@synthesize fullname;
@synthesize tweetID;
@synthesize date;
@synthesize recipient;
@synthesize msg;
@synthesize username;

- (id) initWithDictionary:(NSDictionary*)dict {
	
	self.tweetID	= [dict objectForKey:@"id_str"];
	self.date		= [dict objectForKey:@"created_at"];
	self.recipient	= [dict objectForKey:@"recipient_screen_name"];
	self.msg		= [dict objectForKey:@"text"];
	self.username	= [dict objectForKey:@"sender_screen_name"];
	self.fullname	= [[dict objectForKey:@"sender"] objectForKey:@"name"];
	self.avatarURL	= [[dict objectForKey:@"sender"] valueForKey:@"profile_image_url"];
	
	[NSThread detachNewThreadSelector:@selector(bgThread:) toTarget:self withObject:dict];
	
	return self;
}

-(void)bgThread:(NSDictionary *)obj
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	NSURL *imageURL = [NSURL URLWithString:[[obj objectForKey:@"sender"] valueForKey:@"profile_image_url"]];
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
