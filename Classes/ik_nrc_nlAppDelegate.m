//
//  ik_nrc_nlAppDelegate.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import "ik_nrc_nlAppDelegate.h"
#import "ik_nrc_nlViewController.h"
#import "XMLParser.h"

@implementation ik_nrc_nlAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize ikjes;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	//NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ik" ofType:@"xml"];
	//NSData *data = [NSData dataWithContentsOfFile:filePath];
//	NSLog([data )
	//NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	NSURL *url = [[NSURL alloc] initWithString:@"http://weblogs.nrc.nl/ik/feed/"];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	
	//Initialize the delegate.
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	
	//Set delegate
	[xmlParser setDelegate:parser];
	
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Error Error Error!!!");
	
	for (ikje *i in ikjes) {
		NSLog(@"link: %@ ", [i link]);
		NSLog(@"description: %@ ", [i description]);
	}
	
	
	// Configure and show the window
	[window addSubview:[viewController view]];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
