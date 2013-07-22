//
//  main.m
//  TouchOverlayExample
//
//  Created by markus on 22.7.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

#import "TOApplication.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
		@autoreleasepool {
			return UIApplicationMain(argc,
									 argv,
									 NSStringFromClass([TOApplication class]),
									 NSStringFromClass([AppDelegate class]));
		}
	}
}
