//
//  DWTwitPicUpload.h
//  Tweeterena
//
//  Created by Dominic Wroblewski on 07/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MGTwitterEngine.h"
#import "ASIFormDataRequest.h"
#import "OAConsumer.h"
#import "OARequestHeader.h"

@class OAToken;

@interface DWTwitPicUpload : NSObject <NSXMLParserDelegate> {
	
	NSData *jpegData;
	OAConsumer *consumer;
	OARequestHeader *requestHeader;
	ASIFormDataRequest *request;

}

- (DWTwitPicUpload *)initWithImage:(NSImage*)img twitterEngine:(MGTwitterEngine *)twitter token:(OAToken *)t;
- (int)getStatusCode;
- (NSString *)getResponseString;

@end
