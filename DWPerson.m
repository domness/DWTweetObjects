//
//  Created by Dominic Wroblewski on 03/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "DWPerson.h"


@implementation DWPerson

- (DWPerson *)initWithUser:(NSString*)user {
	
	username = user;
	realName = @"";
	latestTweet = @"";
	imageUrl = @"";
	location = @"";
	description = @"";
	imageUrl = @"";
	
	return self;
}

- (DWPerson *)initWithUserInfo:(NSDictionary*)info {
	
	username = @"blank username";
	latestTweet = @"";
	imageUrl = @"";
	location = @"";
	
	[self setRealName:[info objectForKey:@"name"]];
	[self setUsername:[info objectForKey:@"screen_name"]];
	
	if([[info valueForKey:@"location"] isEqual:[NSNull null]])
	{
		[self setLocation:@""];
	}else{
		[self setLocation:[info objectForKey:@"location"]];
	}
	
	if ([[info valueForKey:@"description"] isEqual:[NSNull null]]) {
		[self setDescription:@""];
	}else {
		[self setDescription:[info valueForKey:@"description"]];
	}
	
	[self setFollowers:[info objectForKey:@"followers_count"]];
	[self setFollowing:[info objectForKey:@"friends_count"]];
	
	if([[info valueForKey:@"url"] isEqual:[NSNull null]])
	{
		[self setURLi:@""];
	}else{
		[self setURLi:[info valueForKey:@"url"]];
	}
	
	[self setImageUrl:[info valueForKey:@"profile_image_url"]];

	return self;
}

- (void)setUsername:(NSString*)user {
	username = user;
}

- (NSString *)getUsername {
	return username;
}

- (void)setRealName:(NSString*)real {
	realName = real;
}

- (NSString *)getRealName {
	return realName;
}

- (void)setLocation:(NSString*)loc {
	location = loc;
}

- (NSString *)getLocation {
	return location;
}

- (void)setDescription:(NSString*)desc {
	description = desc;
}

- (NSString *)getDescription {
	return description;
}

- (void)setURLi:(NSString*)URL {
	url = URL;
}

- (NSString *)getURLi {
	return url;
}

- (void)setFollowers:(NSString*)followers {
	noFollowers = followers;
}

- (NSString *)getFollowers {
	return noFollowers;
}

- (void)setFollowing:(NSString*)following {
	noFollowing = following;
}

- (NSString *)getFollowing {
	return noFollowing;
}

- (void)setImageUrl:(NSString*)imageStr {
	imageUrl = imageStr;
}

- (NSString *)getImageUrl {
	return imageUrl;
}


@end
