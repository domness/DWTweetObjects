//
//  DWTimeInterval.h
//  Tweeterena
//
//  Created by Dominic Wroblewski on 12/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DWTimeInterval : NSObject {
	
	NSString *timeAgo;

}

-(DWTimeInterval *)initWithSinceDate:(NSDate*)date;
-(NSString *)timeAgo;

@end
