//
//  RWSearchResults.m
//  Tweeterena
//
//  Created by Robert White on 08/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import "RWSearchResults.h"
#import "RWResultTweet.h"

@implementation RWSearchResults

-(RWSearchResults *)initWithTwitterArray:(NSMutableArray *)r
{
	results = [[NSMutableArray alloc] initWithArray:r];
	
	return self;
}

-(NSMutableArray *)resultTweets
{
	NSMutableArray *temp = [[NSMutableArray alloc] init];
	for(int i=0; i<[results count]-1; i++)
	{
		RWResultTweet *resultTweet = [[RWResultTweet alloc] initWithDictionary:[results objectAtIndex:i]];
		[temp addObject:resultTweet];
		[resultTweet release];
	}
	
	return temp;
}

@end
