//
//  ik_nrc_nlViewController.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ik_nrc_nlAppDelegate;

@interface ik_nrc_nlViewController : UIViewController {
	IBOutlet UIWebView *description;
	IBOutlet UINavigationItem *ikjeTitle;
	IBOutlet UIBarButtonItem *older;
	IBOutlet UIBarButtonItem *newer;
	ik_nrc_nlAppDelegate *appDelegate;
	int current;
}

- (IBAction) newerIkje;
- (IBAction) olderIkje;
- (void) showIkje:(int)i;
- (void) arrangeButtons;

@end

