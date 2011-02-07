//
//  DWTweet.m
//  Tweeterena
//
//  Created by Dominic Wroblewski on 14/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "DWTweet.h"


@implementation DWTweet

@synthesize tweetID;
@synthesize msg;
@synthesize username;
@synthesize fullname;
@synthesize date;
@synthesize avatar;
@synthesize avatarURL;
@synthesize via;
@synthesize longitude1;
@synthesize latitude1;
@synthesize longitude2;
@synthesize latitude2;
@synthesize longitude3;
@synthesize latitude3;
@synthesize longitude4;
@synthesize latitude4;

- (id) initWithDictionary:(NSDictionary*)dict {
	
	self.tweetID	= [dict objectForKey:@"id_str"];
	self.msg		= [dict objectForKey:@"text"];
	self.username	= [[dict objectForKey:@"user"] objectForKey:@"screen_name"];
	self.fullname	= [[dict objectForKey:@"user"] objectForKey:@"name"];
	self.date		= [dict objectForKey:@"created_at"];
	self.avatarURL	= [[dict objectForKey:@"user"] valueForKey:@"profile_image_url"];
	self.via		= [dict objectForKey:@"source"];
	
	if ([dict objectForKey:@"place"] != [NSNull null]) {
		// Longitude
		self.longitude1 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:2];
		
		// Latitude
		self.latitude1 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:3];
		
		// Longitude
		self.longitude2 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:5];
		
		// Latitude
		self.latitude2 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:6];
		
		// Longitude
		self.longitude3 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:8];
		
		// Latitude
		self.latitude3 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:9];
		
		// Longitude
		self.longitude4 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:11];
		
		// Latitude
		self.latitude4 = [[[[dict objectForKey:@"place"] objectForKey:@"bounding_box"] objectForKey:@"coordinates"] objectAtIndex:12];
		
		
		// NSLog(@"my_coordinate = %@,%@,%@,%@", self.latitude1, self.longitude1, self.latitude2, self.latitude3, self.latitude4);
	}
	
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
