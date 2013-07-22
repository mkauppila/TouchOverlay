//
//  TOOverlayView.m
//  TouchOverlayExample
//
//  Created by markus on 22.7.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "TOOverlayView.h"

const NSInteger TOOverlayViewRecognitionTag = 9898944;

@implementation TOOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
