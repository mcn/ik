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
	NSLog(@"navIkjes: %d", buttons.selectedSegmentIndex);
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
	navigationBar.topItem.title = [[appDelegate.ikjes objectAtIndex:i] title];
	NSString *html = @"<html><head><title></title><style type=\"text/css\">body{font-family: verdana; font-size: 13px; line-height: 150%} strong{display: block;text-transform: uppercase; text-align: right;}</style></head><body>";
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
