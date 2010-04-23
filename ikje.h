//
//  ikje.h
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ikje : NSObject {

	NSString *guid; //Same name as the Entity Name.
	NSString *title; //Same name as the Entity Name.
	NSString *link; //Same name as the Entity Name.
	NSString *pubDate; //Same name as the Entity Name.
	NSString *content; //Same name as the Entity Name.
	
}

@property (nonatomic, retain) NSString *guid;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *pubDate;
@property (nonatomic, retain) NSString *content;

@end
