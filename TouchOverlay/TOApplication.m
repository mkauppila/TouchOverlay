//
//  TOApplication.m
//  TouchOverlayExample
//
//  Created by markus on 22.7.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "TOApplication.h"

#import "TOOverlayView.h"

@implementation TOApplication

- (void)sendEvent:(UIEvent *)event
{
	[super sendEvent:event];
	
	UIWindow *window = [self keyWindow];
	
	TOOverlayView *view = (TOOverlayView *)[window viewWithTag:TOOverlayViewRecognitionTag];
	if (view == nil) {
		view = [[TOOverlayView alloc] initWithFrame:window.bounds];
		view.tag = TOOverlayViewRecognitionTag;
		view.userInteractionEnabled = NO;
		[window addSubview:view];
		NSLog(@"Created subview for drawing");
	}
}

@end
