//
//  DWTimelineUsers.m
//  Tweeterena
//
//  Created by Dominic Wroblewski on 12/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import "DWTimelineUsers.h"


@implementation DWTimelineUsers

-(DWTimelineUsers *)initWithStatuses:(NSArray *)statuses
{
	NSMutableArray * muteArray = [[[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"quickUsers"]] retain];
	
	for (NSDictionary *myDict in statuses)
	{
		
		if ([[myDict objectForKey:@"user"] objectForKey:@"screen_name"]) {
			[muteArray addObject:[[myDict objectForKey:@"user"] objectForKey:@"screen_name"]];
			
		}
	}
	
	for (int i=0; i<=[muteArray count] - 1; i++){
		NSString *originalString = [muteArray objectAtIndex:i];
		NSString *newString = [originalString lowercaseString];
		[muteArray replaceObjectAtIndex:i withObject:newString];
	}
	
	NSArray *copy = [muteArray copy];
	NSInteger index1 = [copy count] - 1;
	for (id object in [copy reverseObjectEnumerator]) {
		if ([muteArray indexOfObject:object inRange:NSMakeRange(0, index1)] != NSNotFound) {
			[muteArray removeObjectAtIndex:index1];
		}
		index1--;
	}
	[copy release];
	
	[[NSUserDefaults standardUserDefaults] setObject:muteArray forKey:@"quickUsers"];
	
	NSLog(@"Stored users");
	
	return self;
}

@end
