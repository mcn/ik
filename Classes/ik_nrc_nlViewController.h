//
//  ik_nrc_nlViewController.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class ik_nrc_nlAppDelegate;

@interface ik_nrc_nlViewController : UIViewController <UIActionSheetDelegate, MFMailComposeViewControllerDelegate> {
	
	ik_nrc_nlAppDelegate *appDelegate;
	
	IBOutlet UIWebView *description;
	IBOutlet UINavigationBar *navigationBar;
	IBOutlet UIBarButtonItem *older;
	IBOutlet UIBarButtonItem *newer;
	int current;
}

- (IBAction) newerIkje;
- (IBAction) olderIkje;
- (void) showIkje:(int)i;
- (void) arrangeButtons;
- (void) showEmailModalView;
- (void) copyLinkToPasteboard;

@end

