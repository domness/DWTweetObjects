//
//  Created by Dominic Wroblewski on 14/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DWTweetCell : NSTextFieldCell {
	
	NSString	*msg;
	NSString	*username;
	NSString	*fullname;
	NSDate		*date;
	NSImage		*avatar;
	
	NSTextFieldCell		* textTextField;
	NSTextFieldCell		* userTextField;
	NSImageCell			* avatarCell;
	NSImageCell			* bgCell;
	NSButtonCell		* replyButton;

}

@property (assign) NSString		* msg;
@property (assign) NSString		* username;
@property (assign) NSString		* fullname;
@property (assign) NSDate		* date;
@property (assign) NSImage		* avatar;

@property (assign) NSTextFieldCell	* textTextField;
@property (assign) NSTextFieldCell	* userTextField;
@property (assign) NSImageCell		* avatarCell;
@property (assign) NSImageCell		* bgCell;
@property (assign) NSButtonCell		* replyButton;

- (void)createCells;
- (void)ensureCellCreated;
- (void)setImage:(NSImage *)image;
- (void)setBgImage;
- (void)setReplyBtn;

- (NSRect)bgFrameForInteriorFrame:(NSRect)frame;
- (NSRect)avatarFrameForInteriorFrame:(NSRect)frame;
- (NSRect)textFrameForInteriorFrame:(NSRect)frame;
- (NSRect)userFrameForInteriorFrame:(NSRect)frame;
- (NSRect)replyFrameForInteriorFrame:(NSRect)frame;

@end
