//
//  ikjeInsturenViewController.m
//  ik@nrc.nl
//
//  Created by Martijn Gastkemper on 4/25/10.
//  Copyright 2010 AdamsYoung. All rights reserved.
//

#import "ikjeInsturenViewController.h"


@implementation ikjeInsturenViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	appDelegate = (ik_nrc_nlAppDelegate *)[[UIApplication sharedApplication] delegate];
	//[appDelegate.navigationController.visibleViewController.navigationItem.backBarButtonItem setTitle:@"Schrijven"];
   	[appDelegate.navigationController.visibleViewController.navigationItem setTitle:@"Gegevens"];
	[appDelegate.navigationController.visibleViewController.navigationItem setRightBarButtonItem:rightButton animated:YES];	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad {
    [super viewDidLoad];
	fields = [[NSArray alloc] initWithObjects:naam, woonplaats, kopsuggestie, nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewStyleGrouped reuseIdentifier:@"cell"];
	//cell.accessoryView = [fields objectAtIndex:indexPath.row]; 
	//textLabel.text = [fields objectAtIndex:indexPath.row];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [fields count];
}

- (void)dealloc {
    [super dealloc];
	[appDelegate release];
}


@end
