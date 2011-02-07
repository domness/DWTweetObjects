//
//  TweetCell.m
//  Tweeterena
//
//  Created by Dominic Wroblewski on 14/11/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "DWTweetCell.h"

#define IMAGE_INSET 8.0
#define ASPECT_RATIO 0.7
#define TITLE_HEIGHT 20.0
#define FILL_COLOR_RECT_SIZE 50.0
#define INSET_FROM_IMAGE_TO_TEXT 4.0

@implementation DWTweetCell

@synthesize tweetID;
@synthesize msg;
@synthesize username;
@synthesize fullname;
@synthesize date;
@synthesize avatar;

@synthesize textTextField;
@synthesize userTextField;
@synthesize avatarCell;
@synthesize bgCell;
@synthesize replyButton;

- (void)createCells {
	//NSLog(@"createCells");
	[self setImage:self.avatar];
	[self ensureCellCreated];
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"displaysFullName"]) {
		self.title					= self.fullname;
	}else{
		self.title					= self.username;
	}
	
	self.textTextField.title	= self.msg;
	[self setBgImage];
	[self setReplyBtn];
}

- (void)setImage:(NSImage *)image {
    if (self.avatarCell == nil) {
        self.avatarCell = [[NSImageCell alloc] init];
        [self.avatarCell setControlView:self.controlView];
        [self.avatarCell setBackgroundStyle:NSBackgroundStyleLight];
    }
    self.avatarCell.image = image;
}

- (void)setBgImage {
    if (self.bgCell == nil) {
        self.bgCell = [[NSImageCell alloc] init];
        [self.bgCell setControlView:self.controlView];
        [self.bgCell setBackgroundStyle:NSBackgroundStyleLight];
		[self.bgCell setImageScaling:NSImageScaleProportionallyUpOrDown];
    }
//	NSImage *bubble = [NSImage imageNamed:@"grey2.png"];
//	
//    self.bgCell.image = bubble;
}

- (void)setReplyBtn {
	if (self.replyButton == nil) {
//		self.replyButton = [[NSButtonCell alloc] init];
//		[self.replyButton setControlView:self.controlView];
//		[self.replyButton setBezelStyle:NSRoundedBezelStyle];
//		[self.replyButton setBezelStyle:NSTexturedSquareBezelStyle];
//		[self.replyButton setStringValue:@"Reply"];
	}
}

- (void)ensureCellCreated {
	
    if (self.textTextField == nil) {
        self.textTextField = [[NSTextFieldCell alloc] init];
        [self.textTextField setControlView:self.controlView];
        [self.textTextField setBackgroundStyle:NSBackgroundStyleLight];
        [self.textTextField setTextColor:[NSColor blackColor]];
		[self.textTextField setFont:[NSFont systemFontOfSize:10]];
		[self.textTextField setEditable:NO];
    }
	
}

- (void)drawInteriorWithFrame:(NSRect)frame inView:(NSView *)controlView {
	//NSLog(@"x=%4.1f y=%4.1f height=%4.1f width=%4.1f",frame.origin.x,frame.origin.y,frame.size.height,frame.size.width);
    
	if (self.bgCell) {
        NSRect bgFrame = [self bgFrameForInteriorFrame:frame];
		
        [self.bgCell drawWithFrame:bgFrame inView:controlView];
    }
	
	if (self.avatarCell) {
        NSRect imageFrame = [self avatarFrameForInteriorFrame:frame];
        [self.avatarCell drawWithFrame:imageFrame inView:controlView];
    }
	
	if (textTextField) {
        NSRect textTextFrame = [self textFrameForInteriorFrame:frame];
        [textTextField drawWithFrame:textTextFrame inView:controlView];
    }
	
	if (replyButton) {
		NSRect buttonFrame = [self replyFrameForInteriorFrame:frame];
		[self.replyButton drawWithFrame:buttonFrame inView:controlView];
	}
    
    NSRect titleFrame = [self userFrameForInteriorFrame:frame];
    [super drawInteriorWithFrame:titleFrame inView:controlView];
	
	
}

// private methods for creating the NSRects in which the Cell elements will be displayed
- (NSRect)bgFrameForInteriorFrame:(NSRect)frame {
	NSRect imageFrame = [self avatarFrameForInteriorFrame:frame];
    NSRect result = frame;
	//NSSize naturalSize = [super cellSize];
	
	// Move our inset to the left of the image frame
    result.origin.x = NSMaxX(imageFrame) + INSET_FROM_IMAGE_TO_TEXT;
    result.size.width = 300;
    result.size.height = 75;
    result.origin.y = floor(NSMidY(imageFrame) - 30);
    return result;
}

- (NSRect)replyFrameForInteriorFrame:(NSRect)frame {
	NSRect result = frame;
    // Inset the top
    result.origin.y += IMAGE_INSET;
    result.size.height -= 2*IMAGE_INSET;
    // Inset the left
    result.origin.x += IMAGE_INSET;
    // Make the width match the aspect ratio based on the height
    result.size.width = ceil(result.size.height * ASPECT_RATIO);
    return result;
}

// private methods for creating the NSRects in which the Cell elements will be displayed
- (NSRect)avatarFrameForInteriorFrame:(NSRect)frame {
    NSRect result = frame;
    // Inset the top
    result.origin.y += IMAGE_INSET;
    result.size.height -= 2*IMAGE_INSET;
    // Inset the left
    result.origin.x += IMAGE_INSET;
    // Make the width match the aspect ratio based on the height
    result.size.width = ceil(result.size.height * ASPECT_RATIO);
    return result;
}

- (NSRect)textFrameForInteriorFrame:(NSRect)frame {
	NSRect imageFrame = [self avatarFrameForInteriorFrame:frame];
    NSRect result = frame;
	
    // Move our inset to the left of the image frame
    result.origin.x = NSMaxX(imageFrame) + INSET_FROM_IMAGE_TO_TEXT;
    result.size.width = NSMaxX(frame) - NSMinX(result);
    result.size.height = FILL_COLOR_RECT_SIZE;
    result.origin.y = floor(NSMidY(imageFrame) - 10);
    return result;
}

- (NSRect)userFrameForInteriorFrame:(NSRect)frame {
	NSRect imageFrame = [self avatarFrameForInteriorFrame:frame];
    NSRect result = frame;
    // Move our inset to the right of the image frame
    result.origin.x = NSMaxX(imageFrame) + INSET_FROM_IMAGE_TO_TEXT;
    // Go as wide as we can
    result.size.width = NSMaxX(frame) - NSMinX(result);
    // Move the title above the Y centerline of the image. 
    NSSize naturalSize = [super cellSize];
    result.origin.y = floor(NSMidY(imageFrame) - naturalSize.height - 15);
    result.size.height = naturalSize.height;
    return result;
}

- (void)highlightSelectionInClipRect:(NSRect)clipRect {
}

- (id)copyWithZone:(NSZone *)zone {
	
	// No need to use this code (think it's for old Mac OS's)
	
    DWTweetCell *zCopyOfMe = [super copyWithZone:zone];
//    if (zCopyOfMe != nil) {
//        // Retain or copy all our ivars
//        
//        zCopyOfMe->msg				= [self.msg				copyWithZone:zone];
//		zCopyOfMe->username			= [self.username		copyWithZone:zone];
//        zCopyOfMe->fullname			= [self.fullname		copyWithZone:zone];
//		zCopyOfMe->date				= [self.date			copyWithZone:zone];
//		zCopyOfMe->avatar			= [self.avatar			copyWithZone:zone];
//
//        zCopyOfMe->textTextField	= [self.textTextField	copyWithZone:zone];
//		zCopyOfMe->userTextField	= [self.userTextField	copyWithZone:zone];
//		zCopyOfMe->avatarCell		= [self.avatarCell		copyWithZone:zone];
//		zCopyOfMe->bgCell			= [self.bgCell			copyWithZone:zone];
//    }
    return zCopyOfMe;
}

@end
