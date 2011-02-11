//
//  RWSearchResults.h
//  Tweeterena
//
//  Created by Robert White on 08/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RWSearchResults : NSMutableArray {

	NSMutableArray *results;
	
}

-(RWSearchResults *)initWithTwitterArray:(NSMutableArray *)r;
-(NSMutableArray *)resultTweets;

@end
