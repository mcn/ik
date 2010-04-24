//
//  ik_nrc_nlViewController.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import "ik_nrc_nlViewController.h"
#import "ik_nrc_nlAppDelegate.h"
#import "ikje.h"

@implementation ik_nrc_nlViewController

//-(IBAction) flipButtonPressed:(id) sender {
//	[UIView beginAnimations:nil context:NULL];
//	[UIView setAnimationDuration:0.5];
//	if ([firstView superview]) {
//		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
//		[firstView removeFromSuperview];   
//		[self addSubview:secondView];
//	}
//	else if ([secondView superview]) {
//		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
//		[secondView removeFromSuperview];  
//		[self addSubview:firstView];
//	}
//	[UIView commitAnimations]
//}

- (IBAction) olderIkje {
	if (current < ([appDelegate.ikjes count] - 1 )) {
		current++;
		[self showIkje:current];
	}
	[self arrangeButtons];
}

- (IBAction) newerIkje {
	
	if (current != 0) {
		current--;
		[self showIkje:current];
	}
	[self arrangeButtons];
}

- (void) arrangeButtons {
	NSLog(@"arrangeButtons: %d", current);
	if (current == 0) {
		newer.enabled = NO;
	} else if (current == ([appDelegate.ikjes count] - 1 )) {
		older.enabled = NO;
	} else {
		newer.enabled = YES;
		older.enabled = YES;
	}

}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	current = 0;
	[self showIkje:current];
	NSLog(@"viedDidLoad");
}

- (void) showIkje:(int)i {
	navigationBar.topItem.title = [[appDelegate.ikjes objectAtIndex:i] title];
	NSString *html = @"<html><head><title></title></head><body>";
	html = [html stringByAppendingFormat:[[appDelegate.ikjes objectAtIndex:i] content]];
	html = [html stringByAppendingFormat:@"</body></html>"];
	[description loadHTMLString:html baseURL:[[NSURL alloc] initWithString:@"http://www.google.com/"]];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
