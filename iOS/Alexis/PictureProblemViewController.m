//
//  PictureProblemViewController.m
//  Alexis
//
//  Created by srrobin4 on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PictureProblemViewController.h"


@implementation PictureProblemViewController
@synthesize answer;
@synthesize scrollView;

-(IBAction) hideKeyboard
{
    [self resignFirstResponder];
}

-(IBAction) submitAnswer
{
    if([answer.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"No Answer"
                              message: @"Please enter an answer."
                              delegate: nil
                              cancelButtonTitle:@"Ok :("
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Thanks!"
                              message: @"Answer submitted!"
                              delegate: nil
                              cancelButtonTitle:@"AWWWW YEAAAAA!"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [answer setText:@""];
        [self.navigationController popViewControllerAnimated:YES];
    }

}

-(IBAction) backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

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
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(320, 600)];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
