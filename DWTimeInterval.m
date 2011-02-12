//
//  DWTimeInterval.m
//  Tweeterena
//
//  Created by Dominic Wroblewski on 12/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import "DWTimeInterval.h"


@implementation DWTimeInterval


-(DWTimeInterval *)initWithSinceDate:(NSDate*)date
{
	NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:date];	
	int distance = interval;
	timeAgo = @"";
	
	if (distance < 0) distance = 0;
	
	if (distance < 60) {
		timeAgo = [NSString stringWithFormat:@"%d%s", distance, (distance == 1) ? " second ago" : " seconds ago"];
	} else if (distance < 60 * 60) {  
		distance = distance / 60;
		timeAgo = [NSString stringWithFormat:@"%d%s", distance, (distance == 1) ? " minute ago" : " minutes ago"];
	} else if (distance < 60 * 60 * 24) {
		distance = distance / 60 / 60;
		timeAgo = [NSString stringWithFormat:@"%d%s", distance, (distance == 1) ? " hour ago" : " hours ago"];
	} else if (distance < 60 * 60 * 24 * 7) {
		distance = distance / 60 / 60 / 24;
		timeAgo = [NSString stringWithFormat:@"%d%s", distance, (distance == 1) ? " day ago" : " days ago"];
	} else if (distance < 60 * 60 * 24 * 7 * 4) {
		distance = distance / 60 / 60 / 24 / 7;
		timeAgo = [NSString stringWithFormat:@"%d%s", distance, (distance == 1) ? " week ago" : " weeks ago"];
	} else {
		
		NSDate *d = date;
		NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
		
		[myFormatter setDateFormat:@"dd MMM yyyy"];
		timeAgo = [myFormatter stringFromDate:d];
        [myFormatter release];
	}
	
	return self;
}
-(NSString *)timeAgo
{
	return timeAgo;
}

@end
