//
//  ik_nrc_nlViewController.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/22/10.
//  Copyright AdamsYoung 2010. All rights reserved.
//

#import "ik_nrc_nlViewController.h"
#import "ik_nrc_nlAppDelegate.h"
#import "ikje.h"

@implementation ik_nrc_nlViewController

- (IBAction) showActionSheet {
	NSLog(@"showActionSheet");
	UIActionSheet *sheet = [[UIActionSheet alloc]
							initWithTitle: @""
							delegate:self
							cancelButtonTitle:@"Annuleren"
							destructiveButtonTitle:nil
							otherButtonTitles:@"Zelf een ‘ik’ insturen", @"Kopieer link van deze ‘ik’", @"Deze ‘ik’ versturen", nil];
	[sheet showInView:self.view];
	[sheet release];
	
}

- (IBAction) navIkjes {
	NSLog(@"navIkjes");
	switch (buttons.selectedSegmentIndex ) {
		case 0:
			if (current < ([appDelegate.ikjes count] - 1 )) {
				current++;
				[self showIkje:current];
			}
			break;
		case 1:
			if (current != 0) {
				current--;
				[self showIkje:current];
			}
		break;

		default:
			break;
	}
	[self arrangeButtons];
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)indexPath
{
	NSLog(@"indexPath: %d", indexPath);
    //NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    switch (indexPath)
	{
        case 0:
		{
			
//			NSString * videoLink = @"http://vpodcast.dr.dk/DR2/Soeinding/2009/Soeinding_0910132030.mp4";
//			NSLog(@"Playing video: %@", videoLink);
//			
//			NSURL *movieURL = [[NSURL URLWithString:videoLink] retain];
//			
//			MPMoviePlayerController *DingPlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
//			[DingPlayer play];
        } break;
		case 1:
			[self copyLinkToPasteboard];
			break;
		case 2:
			[self showEmailModalView];
		break;

			
    }
//    [self.tableView deselectRowAtIndexPath:selectedIndexPath animated:YES];
}


- (void) arrangeButtons {
	if (current == 0) {
		[buttons setEnabled:NO forSegmentAtIndex:1];
	} else if (current == ([appDelegate.ikjes count] - 1 )) {
		[buttons setEnabled:NO forSegmentAtIndex:0];
	} else {
		[buttons setEnabled:YES forSegmentAtIndex:0];
		[buttons setEnabled:YES forSegmentAtIndex:1];		
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	current = 0;
	[self showIkje:current];
	[self arrangeButtons];
	NSLog(@"viedDidLoad");
}

- (void) showIkje:(int)i {
	ikje *currentIkje = [appDelegate.ikjes objectAtIndex:current];
	NSLog(@"showikje: %d", i);
	navigationBar.topItem.title = [[appDelegate.ikjes objectAtIndex:i] title];
	NSString *backgroundImage = @"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUAAAAAyCAMAAAFt1MJwAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAARpQTFRF/vr61RYc1RMZ0wsS1RIY2Skv9MHD7p6g6oeL1x4l5nZ6/fX21RQa/vj4/vf43UNI+Nrb3kRJ/fP0/fHy99HS+uLj6oyP30xR7p+h7Z2f30tQ1hce2jI31hoh5GZq42Ro3DxC646R9szN4l5i8bGz9s/Q99DR+dzd/O/v2S0z+uTl9MDC9MLE99LT7JaZ7JWY2zM52CUr3UFG1RUb3klO+dvc1yAm87u94FFW3T9E8ra4+uXm4l1i3D5E3DtB/vz89cnL4lxh8a+x/PHx2Sgu53l9++vr2CQq9L/B6ouP/O7u6oqO/PDw4FNY/fb3+eDh5nF142Bk2CYs4FJX5nR41BAX3kdM4E9U87y+99TV++rq7p+i0wkQ////JXY11AAAAhFJREFUeNpiiCUSMMQaE6swNoZohTHEKbTnJ9bEWOoqBAggEhSqE6uQKYba4RgzUL4GCCCiFZJgIF+ML3UNBCWzGKoaaEtF88DxLBJLbS9TEwAE0FAwkDuG2i6MiaG2l2NihKlroF5MDBdVDfSKiQmnspf9B3WkaMTEjmY9igBAAFHdwJHpQMaYGMnBHYKewFqUc1BHMW8MCHgM5jQoC3ai1KB1INh50YM2BFWArmMZxGmQJSZGcXDn4kFcGo7WJJQCgADs1jEOQEAQhWEhQiGxJDoJkWgoNC5A4QJCNfc/h511iV/MDb5kd957BvwHMIIDc7nZwEGkYD9x5ZvuQB+JLoWdDBxV2JFjplRhSs7BsAcl4gLdK+QC2+CbsMBMeTH3D9bqW8FXnHjfAs7B0/scuElmkQvdxZv08D3Y2KI2oAG/C3wEaL/eWggIwjCOW7LOymkp5UYpRbHlLCnkgoRcoPn+n0PbNPbWvHuB+j+fYPr1zrzP/PwBAQSQfARYLbUrcIgBy6ug8A/vgIgnMK3/xLsCJsI3sONowsEaFdkSyflaUCU8XGRb+KBMZiNoJDWm77wJ8ylwBD0wVldhpgt8rIu0Gw8Buz18bAEvIV+2iI4t4KNp9JIuNPaAN8N3PgFjD1jba73rBBUJoKf5WhtMJIDPbaA3ngMinsBGZnmEI3oPJAAC+F+AikQKE8gV/m5eKwCZ2giSjtwAAAAASUVORK5CYII=";
	NSString *html = [NSString stringWithFormat:@"<html><head><title></title><style type=\"text/css\">h1{ margin: 10px 0px 20px 0px; font-family: Helvetica; font-size: 20px;} html{font-family: verdana; font-size: 14px; background: url(\"%@\") top left no-repeat;} body{margin: 0px 10px 0px 35px;} strong{display: block;text-transform: uppercase; text-align: right;}</style></head><body><h1>%@</h1>", backgroundImage, currentIkje.title];
	html = [html stringByAppendingFormat:[[appDelegate.ikjes objectAtIndex:i] content]];
	html = [html stringByAppendingFormat:@"</body></html>"];
	[description loadHTMLString:html baseURL:[[NSURL alloc] initWithString:@"http://weblogs.nrc.nl/ik/"]];
}

-(void) showEmailModalView {
	ikje *currentIkje = [appDelegate.ikjes objectAtIndex:current];
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self; // <- very important step if you want feedbacks on what the user did with your email sheet
	
    [picker setSubject:currentIkje.title];
	
    // Fill out the email body text
    NSString *pageLink = @"http://mugunthkumar.com/mygreatapp"; // replace it with yours
    NSString *iTunesLink = @"http://link-to-mygreatapp"; // replate it with yours
    NSString *emailBody = [NSString stringWithFormat:@"[ik@nrc.nl is een lezerscolumn van NRC Handelsblad] %@ <a href='%@'>%@</a><br><br>Met de <a href = '%@'>ik@nrc.nl iPhone applicatie</a> verstuurt. <a href = '%@'>Download</a> de applicatie in de iTunes-winkel!", currentIkje.content, currentIkje.guid, currentIkje.guid, pageLink, iTunesLink];
	
    [picker setMessageBody:emailBody isHTML:YES]; // depends. Mostly YES, unless you want to send it as plain text (boring)
	
    [self presentModalViewController:picker animated:YES];
    [picker release];
	
}

// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{ 
    // Notifies users about errors associated with the interface
    switch (result)
    {
		case MFMailComposeResultCancelled:
			break;
		case MFMailComposeResultSaved:
			break;
		case MFMailComposeResultSent:
			break;
		case MFMailComposeResultFailed:
			break;
			
		default:
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email" 
															message:@"Verzenden misluk"
															delegate:self 
															cancelButtonTitle:@"OK"
															otherButtonTitles: nil];
			 [alert show];
			 [alert release];
		}
		break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

- (void) copyLinkToPasteboard {
	ikje *currentIkje = [appDelegate.ikjes objectAtIndex:current];
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:
						  currentIkje.guid, @"public.utf8-plain-text", [NSURL URLWithString:currentIkje.guid],
						  (NSString *)currentIkje.guid,
						  nil];
	pasteboard.items = [NSArray arrayWithObject:item];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
