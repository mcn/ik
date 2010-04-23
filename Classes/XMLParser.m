//
//  XMLParser.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import "XMLParser.h"
#import "ik_nrc_nlAppDelegate.h"
#import "ikje.h"


@implementation XMLParser 

- (XMLParser *) initXMLParser {
	
	[super init];
	
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.ikjes;
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	
	NSLog(@"Gevonden Element: %@", elementName);
	
	if([elementName isEqualToString:@"channel"]) {
		//Initialize the array.
		appDelegate.ikjes = [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"item"]) {
		
		//Initialize the book.
		aIkje = [[ikje alloc] init];
		
		//Extract the attribute here.
		//aIkje.setLink([[attributeDict objectForKey:@"link"] stringValue]);
		
		//NSLog(@"Link waarde is :%i", aIkje.getLink());
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
	
	NSLog(@"Processing Value: %@", currentElementValue);
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	NSLog(@"elementName: %@", elementName);
	if([elementName isEqualToString:@"channel"])
		return;
	
	//There is nothing to do if we encounter the Books element here.
	//If we encounter the Book element howevere, we want to add the book object to the array
	// and release the object.
	if([elementName isEqualToString:@"item"]) {
		[appDelegate.ikjes addObject:aIkje];
		
		[aIkje release];
		aIkje = nil;
	}
	else if ([elementName isEqualToString:@"link"] || [elementName isEqualToString:@"description"] || [elementName isEqualToString:@"guid"] || [elementName isEqualToString:@"title"] || [elementName isEqualToString:@"pubDate"] )	{
		[aIkje setValue:currentElementValue forKey:elementName];
	}
	
	[currentElementValue release];
	currentElementValue = nil;
}

@end
