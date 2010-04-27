//
//  ikjeInsturenViewController.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/25/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ik_nrc_nlAppDelegate.h"


@interface ikjeInsturenViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

	ik_nrc_nlAppDelegate *appDelegate;
	IBOutlet UIBarButtonItem *rightButton;
	IBOutlet UITextField *naam;
	IBOutlet UITextField *woonplaats;
	IBOutlet UITextField *kopsuggestie;
	NSArray *fields;
}

@end
