//
//  ik_nrc_nlAppDelegate.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ik_nrc_nlViewController;
@class ikjeInsturenViewController;
@class ikjeSchrijfViewController;

@interface ik_nrc_nlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navigationController;
    ik_nrc_nlViewController *ikjesViewController;
	ikjeSchrijfViewController *schrijfViewController;
	ikjeInsturenViewController *insturenViewController;
	
	NSMutableArray *ikjes;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet ik_nrc_nlViewController *ikjesViewController;
@property (nonatomic, retain) IBOutlet ikjeSchrijfViewController *schrijfViewController;
@property (nonatomic, retain) IBOutlet ikjeInsturenViewController *insturenViewController;
@property (nonatomic, retain) NSMutableArray *ikjes;

@end

