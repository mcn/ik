//
//  ikje.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import "ikje.h"


@implementation ikje

@synthesize guid, link, pubDate, content, title;

//@dynamic title;
//
//- (NSString *)title {
//	
//    return [title autorelease];
//	
//}
//
//- (void) setTitle:(NSString *) newTitle{
//	NSLog(@"setTitle: %@", newTitle);
//	if (newTitle != title) {
//		[newTitle retain];
//		[title release];
//        title = [newTitle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//		
//    }
//}

- (void) dealloc {
	[title release];
	[guid release];
	[pubDate release];
	[content release];
	[super dealloc];
}

@end
