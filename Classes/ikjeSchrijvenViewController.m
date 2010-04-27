//
//  ikjeSchrijvenViewController.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/25/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import "ikjeSchrijvenViewController.h"
#import "ikjeInsturenViewController.h"

@implementation ikjeSchrijvenViewController

- (IBAction) clearTextView {
	[textView setText:@""];
}

- (IBAction) toIkjeInsturen {
	NSLog(@"toIkjeVersturen: %d", textView.text.length);
	if (textView.text.length > wordLimit) {
		//TODO: Hide keyboard!
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lengte" message:[NSString stringWithFormat:@"Het maximaal aantal tekens van %d is overschreden", wordLimit] delegate:nil cancelButtonTitle:@"Terug" otherButtonTitles:nil];
		[alert show];
		[alert release];
	} else {
		[appDelegate.navigationController pushViewController:[[ikjeInsturenViewController alloc] init] animated:YES];
	}
}

- (void)textViewDidChange:(UITextView *)aTextView {
	 [appDelegate.navigationController.navigationBar.topItem setTitle:[NSString stringWithFormat:@"%d",wordLimit - aTextView.text.length]];
}

- (void) viewDidLoad {

}

- (void)viewWillAppear:(BOOL)animated {
	wordLimit = 50;
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSLog(@"willAppear: %@ ", appDelegate.navigationController.navigationItem);
    [super viewWillAppear:animated];
	[appDelegate.navigationController.visibleViewController.navigationItem setTitle:[NSString stringWithFormat:@"%d",wordLimit]];
	[appDelegate.navigationController.visibleViewController.navigationItem setRightBarButtonItem:barButton animated:YES];	
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
