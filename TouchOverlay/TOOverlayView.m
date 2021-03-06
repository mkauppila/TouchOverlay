// TOOverlayView.m
//
// Copyright (c) 2013 Markus Kauppila <markus.kauppila@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to  use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "TOOverlayView.h"

#import "TouchOverlay.h"

static inline CGPoint CGPointSubtract(CGPoint left, CGPoint right) {
	return CGPointMake(left.x - right.x, left.y - right.y);
}

static inline CGPoint Perpendicular(CGPoint point) {
	return CGPointMake(-point.y, point.x);
}

static inline CGPoint Normalize(CGPoint point) {
	const CGFloat lenght = sqrtf(point.x * 2 + point.y * 2);
	return CGPointMake(point.x / lenght, point.x / lenght);
}

const NSInteger TOOverlayViewRecognitionTag = 9898944;

@interface TOOverlayView ()
@property (strong, nonatomic) NSMutableArray *points;
@end

@implementation TOOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)clearAllTouchPoints
{
	[self.points removeAllObjects];
}

- (void)addTouchPoints:(NSArray *)newPoints
{
	if (self.points == nil) {
		self.points = [NSMutableArray array];
	}
	[self.points addObjectsFromArray:newPoints];
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextClearRect(context, self.bounds);
	
	CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
	CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
	
	[self.points enumerateObjectsUsingBlock:^(NSValue *value, NSUInteger idx, BOOL *stop) {
		CGPoint point = [value CGPointValue];
		if (idx == 0) {
			CGContextMoveToPoint(context, point.x, point.y);
		} else {
			/*
			CGPoint prevPoint = [[self.points objectAtIndex:idx - 1] CGPointValue];
			CGPoint direction = CGPointSubtract(point, prevPoint);
			
			CGPoint perp = Perpendicular(direction);
			perp = Normalize(perp);
			
			CGPoint temp = CGPointMake(perp.x + point.x, perp.y + point.y);
			//CGContextFillRect(context, CGRectMake(perp.x - 1.0f, perp.y - 1.0f, 1.0f, 1.0f));
			CGContextAddLineToPoint(context, temp.x, temp.y);
			*/
			
			CGContextAddLineToPoint(context, point.x, point.y);
		}
	}];
	CGContextStrokePath(context);
}

@end
