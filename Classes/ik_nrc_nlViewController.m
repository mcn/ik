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
#import "ikjeSchrijvenViewController.h"

@implementation ik_nrc_nlViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	current = 0;
	[self showIkje:current];
	[self arrangeButtons];
}

- (IBAction) showActionSheet {
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
	//appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
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
    switch (indexPath)
	{
        case 0:
		{
			[appDelegate.navigationController pushViewController:[[ikjeSchrijvenViewController alloc] init] animated:YES];
        } break;
		case 1:
			[self copyLinkToPasteboard];
			break;
		case 2:
			[self showEmailModalView];
		break;

			
    }
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

- (void) showIkje:(int)i {
	ikje *currentIkje = [appDelegate.ikjes objectAtIndex:current];
	NSLog(@"showikje: %d", i);
	navigationBar.topItem.title = [[appDelegate.ikjes objectAtIndex:i] title];
	NSString *backgroundImage = @"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAUCAMAAAH5KRy1AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAOFQTFRF0wkQ0gIJ0QAE0QAC0gUM0QAF0AAB0wcP87u9//390woR3D1D0QAD98/Q31BT0QAB0gQL0gcJ/fT01AwT2Scs8ra49cfI3URJ415i/fT1+uXl76ap1yIn/O/w1hog8Kiq0AAA/fP0++bm6oiM6YGF+dvd7ZmczwAA2Skv9cnL7JSX1yEm42Fl+uTl5GZq42Jm5nZ60AAC53h85Gdr76Sn1RQb2Ssx99LT6YaI0QAG+NjZ0wcO0gML0QAH3kZL4ltg3DxC0gYM1RUazgAA+uPk//7+0gMK0QIH0wUM8Kqt////uXjaPgAAAMBJREFUeNpi8PJi8GJl8PICCCAGLwZ7BnmAAGLwsgPyHbQBAggo4MXACpLjEgLKeDE4e3kBBBCDF68XSNhLidEJRHl58XCpM3iJMkpAeEAAEEBwihNMmShIgXkylp5gJYYseiDKgMFGi8FLkomJA8hzZJIFyumYImkHCDAoBeOoCBorwjle+szMZppwZdLu7IwsyjA9uhpuDNb84lZgjrmcB4OtsJoriGPEzM7GrQpW5iLCJmDBCTWAg08MYQ8SAABGpTYnYu/0vQAAAABJRU5ErkJggg==";
	NSString *html = [NSString stringWithFormat:@"<html><head><title></title><style type=\"text/css\">h1{background: url(\"%@\") 2px left no-repeat; border-bottom: 1px solid #d30910; padding: 0px 0px 5px 20px; margin: 10px 0px 15px 0px; font-family: Helvetica; font-size: 20px;} html{font-family: verdana; font-size: 14px;} body{margin: 0px 15px 0px 15px;} strong{display: block;text-transform: uppercase; text-align: right; font-size: 13px;}</style></head><body><h1>%@</h1>", backgroundImage, currentIkje.title];
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

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
    [super dealloc];
}

@end
