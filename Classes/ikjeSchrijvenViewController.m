//
//  ikjeSchrijvenViewController.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/25/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import "ikjeSchrijvenViewController.h"


@implementation ikjeSchrijvenViewController

- (IBAction) clearTextView {
	[textView setText:@""];
}

- (void)textViewDidChange:(UITextView *)aTextView {
	//UILabel *titleLabel = [[UILabel alloc] init];
	//[titleLabel setText:[NSString stringWithFormat:@"%d",wordLimit - aTextView.text.length]];
//	 [titleLabel setTextColor:[UIColor redColor]];
	 [appDelegate.navigationController.navigationBar.topItem setTitle:[NSString stringWithFormat:@"%d",wordLimit - aTextView.text.length]];
	//appDelegate.navigationController.navigationItem.titleView = titleLabel;
	//[appDelegate.navigationController.navigationBar.topItem setTitleView:titleLabel];
	//[titleLabel release];
}

- (void) viewDidLoad {
	wordLimit = 50;
	[appDelegate.navigationController.navigationBar.topItem setTitle:[NSString stringWithFormat:@"%d",wordLimit]];
	//UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
//																	style:UIBarButtonItemStyleBordered target:nil action:nil];
	//[appDelegate.navigationController.navigationItem setRightBarButtonItem:rightButton animated:YES];
	//UINavigationItem *rightButton = [[UINavigationItem alloc] initWithTitle:@"Verzend"];
//	[appDelegate.navigationController.navigationBar pushNavigationItem:rightButton animated:YES];
//	[rightButton release];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
																	style:UIBarButtonSystemItemDone target:nil action:nil];
	
	//UINavigationItem *rightButton = [[UINavigationItem alloc] initWithTitle:@"Verzend"];
	[appDelegate.navigationController.navigationItem setRightBarButtonItem:rightButton animated:NO];
	[rightButton release];
}

- (void)viewWillAppear:(BOOL)animated {
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSLog(@"willAppear: %@ ", appDelegate.navigationController.navigationItem);
    [super viewWillAppear:animated];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
																	style:UIBarButtonSystemItemDone target:nil action:nil];

	//UINavigationItem *rightButton = [[UINavigationItem alloc] initWithTitle:@"Verzend"];
	[appDelegate.navigationController.navigationItem setRightBarButtonItem:rightButton animated:YES];
	//[appDelegate.navigationController.navigationBar pushNavigationItem:rightButton animated:YES];

	//	[appDelegate.navigationController.navigationItem setRightBarButtonItem:rightButton animated:YES];
//	UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Title"];
//	appDelegate.navigationController.navigationItem.rightBarButtonItem = rightButton;
//	[appDelegate.navigationController.navigationBar pushNavigationItem:item animated:NO];
//	[rightButton release];
	
	
   // appDelegate.navigationController.navigationItem.rightBarButtonItem = [ [ [UIBarButtonItem alloc]
//																			initWithTitle:@"Verzend" style:UIBarButtonItemStyleBordered target:self action:@selector(verzend)] autorelease];
												//UIBarButtonSystemItemAdd target:self
//												action:@selector(add_clicked)] autorelease];
	
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
	[appDelegate release];
}


@end
