//
//  UserChoiceController.m
//  Alexis
//
//  Created by brtucker on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserChoiceController.h"


@implementation UserChoiceController
@synthesize tableView, viewArray;
@synthesize PictureProblemViewController, ProblemViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [viewArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    viewArray = [[NSMutableArray alloc] init];
    [self populateViewArray];
    // Do any additional setup after loading the view from its nib.
}

-(void)populateViewArray{
    [viewArray addObject:@"Text-Based Problem"];
    [viewArray addObject:@"Picture-Based Problem"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [viewArray count];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
    // Changed UITableView to Cell, check where tableView is supposed to point to (scope problems)
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    
    //for(int index; index < (sizeof(viewArray)); index++){
        [cell.textLabel setText:[viewArray objectAtIndex:indexPath.row]];
    //}
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            [self.navigationController pushViewController:self.ProblemViewController animated:YES];
            break;
        case 1:
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            [self.navigationController pushViewController:self.PictureProblemViewController animated:YES];
            break;
        default:
            break;
    }
}

@end
