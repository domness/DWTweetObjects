//
//  DWTwitPicUpload.m
//  Tweeterena
//
//  Created by Dominic Wroblewski on 07/02/2011.
//  Copyright 2011 TerraCoding. All rights reserved.
//

#import "DWTwitPicUpload.h"

#define TWITPIC_API_KEY @""

@implementation DWTwitPicUpload


- (DWTwitPicUpload *)initWithImage:(NSImage*)img twitterEngine:(MGTwitterEngine *)twitter token:(OAToken *)t
{
	
	CIImage *myImage = [CIImage imageWithData:[img TIFFRepresentation]];
	NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithCIImage:myImage];
	jpegData = [bitmapRep representationUsingType:NSJPEGFileType properties:nil];
	
	if (jpegData) {
		NSLog(@"Pic not nil");
	}
	
	NSURL *url = [NSURL URLWithString:@"http://api.twitpic.com/2/upload.json"];
	
	consumer = [[[OAConsumer alloc] initWithKey:[twitter consumerKey] secret:[twitter consumerSecret]] autorelease];
	requestHeader = [[[OARequestHeader alloc] initWithProvider:@"https://api.twitter.com/1/account/verify_credentials.json"
														method:@"GET"
													  consumer:consumer
														 token:t
														 realm:@"http://api.twitter.com/"] autorelease];
	
	NSString *oauthHeaders = [requestHeader generateRequestHeaders];
	
	request = [ASIFormDataRequest requestWithURL:url];
	[request addRequestHeader:@"X-Verify-Credentials-Authorization" value:oauthHeaders];
	[request addRequestHeader:@"X-Auth-Service-Provider" value:@"https://api.twitter.com/1/account/verify_credentials.json"];
	[request addPostValue:TWITPIC_API_KEY forKey:@"key"];
	[request addData:jpegData forKey:@"media"];
	
	request.requestMethod = @"POST";
	
	[request startSynchronous];
	
	NSLog(@"Got HTTP status code from TwitPic: %d", [request responseStatusCode]);
	NSLog(@"Response String = %@", [request responseString]);
	
	return self;
}

- (int)getStatusCode
{
	return [request responseStatusCode];
}

- (NSString *)getResponseString
{
	return [request responseString];
}


@end
