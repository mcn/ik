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
	IBOutlet UISegmentedControl *buttons;
	int current;
}

- (IBAction) navIkjes;
- (IBAction) showActionSheet;
- (void) showIkje:(int)i;
- (void) arrangeButtons;
- (void) showEmailModalView;

@end

