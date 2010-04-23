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
	
	ik_nrc_nlAppDelegate *appDelegate;
	
//	IBOutlet UITextView	*description;
	IBOutlet UIWebView *description;
	IBOutlet UINavigationBar *navigationBar;
	NSInteger current;
}

- (IBAction) changeIkje;
- (void) showIkje:(NSInteger *)i;

@end

