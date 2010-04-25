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
@synthesize navigationController;
@synthesize schrijvenViewController;

//- (void)applicationDidFinishLaunching:(UIApplication *)application {
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSLog(@"applicationDidFinish");
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ik" ofType:@"xml"];
	NSData *data = [NSData dataWithContentsOfFile:filePath];
//	NSLog([data )
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
	
	for (ikje *i in ikjes) {
		NSLog(@"link: %@ ", [i link]);
		NSLog(@"description: %@ ", [i description]);
		NSLog(@"title: %@ ", [i title]);
		NSLog(@"content: %@ ", [i content]);
	}

	//[navigationController pushViewController:[[ikjeSchrijvenViewController alloc] init] animated:YES];
	//[navigationController pushViewController:viewController animated:YES];
	//[self.navigationController pushViewController:viewController animated:YES];
	//[navigationController initWithRootViewController:viewController];
	// Configure and show the window
	//[window addSubview:[viewController view]];
	[window addSubview:navigationController.view];
	//[window addSubview:[navigationController view]];
	NSLog(@"na addsubview");
	[window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
	[navigationController release];
	[schrijvenViewController release];
    [super dealloc];
}


@end
