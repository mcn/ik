//
//  ik_nrc_nlAppDelegate.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ikjeSchrijvenViewController.h"

@class ik_nrc_nlViewController;
@class ikjeSchrijvenViewController;

@interface ik_nrc_nlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ik_nrc_nlViewController *viewController;
	UINavigationController *navigationController;
	ikjeSchrijvenViewController *schrijvenViewController;
	
	NSMutableArray *ikjes;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ik_nrc_nlViewController *viewController;
@property (nonatomic, retain) IBOutlet ikjeSchrijvenViewController *schrijvenViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *ikjes;

@end

