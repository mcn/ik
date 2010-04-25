//
//  ik_nrc_nlAppDelegate.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ik_nrc_nlViewController;

@interface ik_nrc_nlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ik_nrc_nlViewController *viewController;
	//IBOutlet UINavigationController*  myNavigationController;
	
	NSMutableArray *ikjes;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ik_nrc_nlViewController *viewController;
@property (nonatomic, retain) NSMutableArray *ikjes;

@end

