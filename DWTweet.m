//
//  Tweet.m
//  Tweeterena
//
//  Created by Dominic Wroblewski on 14/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "DWTweet.h"


@implementation DWTweet

@synthesize msg;
@synthesize username;
@synthesize fullname;
@synthesize date;
@synthesize avatar;

- (id) initWithDictionary:(NSDictionary*)dict {
	
	self.msg = [dict objectForKey:@"text"];
	self.username = [[dict objectForKey:@"user"] objectForKey:@"screen_name"];
	self.fullname = [[dict objectForKey:@"user"] objectForKey:@"name"];
	self.date = [dict objectForKey:@"created_at"];
	
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
		NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
		NSImage *image = [[NSImage alloc] initWithData:imageData];
		return image;
	}
	return nil;
	
	
}

@end
