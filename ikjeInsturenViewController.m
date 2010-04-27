//
//  ikjeInsturenViewController.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/25/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import "ikjeInsturenViewController.h"


@implementation ikjeInsturenViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	//[appDelegate.navigationController.visibleViewController.navigationItem.backBarButtonItem setTitle:@"Schrijven"];
   	[appDelegate.navigationController.visibleViewController.navigationItem setTitle:@"Gegevens"];
	[appDelegate.navigationController.visibleViewController.navigationItem setRightBarButtonItem:rightButton animated:YES];	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
