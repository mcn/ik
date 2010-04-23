//
//  ikje.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import "ikje.h"


@implementation ikje

@synthesize guid, title, link, pubDate, content;

- (void) dealloc {
	[title release];
	[guid release];
	[pubDate release];
	[content release];
	[super dealloc];
}

@end
