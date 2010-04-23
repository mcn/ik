//
//  XMLParser.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ik_nrc_nlAppDelegate.h"
#import "ikje.h"

@class ik_nrc_nlAppDelegate, Ikje;

@interface XMLParser : NSObject {
	NSMutableString *currentElementValue;
	
	ik_nrc_nlAppDelegate *appDelegate;
	ikje *aIkje;
}

- (XMLParser *) initXMLParser;

@end
