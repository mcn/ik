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
@synthesize ikjes;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSLog(@"applicationDidFinish");
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ik" ofType:@"xml"];
	NSData *data = [NSData dataWithContentsOfFile:filePath];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	
	//NSURL *url = [[NSURL alloc] initWithString:@"http://weblogs.nrc.nl/ik/feed/"];
	//NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	
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

	// Configure and show the window
	[window addSubview:navigationController.view];
	[window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
    [window release];
	[navigationController release];
	[ikjes release];
    [super dealloc];
}


@end
