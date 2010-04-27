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
	
	if([elementName isEqualToString:@"channel"]) {
		//Initialize the array to store the ikjes.
		appDelegate.ikjes = [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"item"]) {
		//Initalize an ikje
		aIkje = [[ikje alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if(!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if([elementName isEqualToString:@"channel"])
		return;
	
	if([elementName isEqualToString:@"item"]) {
		[appDelegate.ikjes addObject:aIkje];
		[aIkje release];
		aIkje = nil;
	}
	else if ([elementName isEqualToString:@"link"] || [elementName isEqualToString:@"guid"] || [elementName isEqualToString:@"title"] || [elementName isEqualToString:@"pubDate"] )	{
		[aIkje setValue:[currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]forKey:elementName];
	} else if ([elementName isEqualToString:@"content:encoded"]) {
		[aIkje setValue:currentElementValue forKey:@"content"];
	}
	
	[currentElementValue release];
	currentElementValue = nil;
}

@end
