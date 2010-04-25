//
//  ikjeSchrijvenViewController.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/25/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ik_nrc_nlAppDelegate.h"

@class ik_nrc_nlAppDelegate;

@interface ikjeSchrijvenViewController : UIViewController <UITextViewDelegate> {
	IBOutlet UITextView *textView;
	IBOutlet ik_nrc_nlAppDelegate *appDelegate;
}

- (IBAction) clearTextView;

@end
