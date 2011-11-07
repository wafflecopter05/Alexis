//
//  LoginViewController.m
//  Alexis
//
//  Created by Blake Tucker on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController
@synthesize user, pass, username, password, temppass, tempuser, loginInfo, _login, window;

BOOL _login = YES;

-(IBAction) hideKeyboard
{
    [self resignFirstResponder];
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Moves contents of plist file into loginInfo dictionary, which we will use in the login method to check for valid login info
    self.loginInfo = [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LoginInfo" ofType:@"plist"]] autorelease];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) login
{
    _login = false;
    
    NSString *userIn = user.text;
    NSString *passIn = pass.text;
    
    @try {
        _login = [passIn isEqualToString:[self.loginInfo objectForKey:(userIn)]];
    }
    @catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Dictionary Error"
                              message: @"Error matching key/value"
                              delegate: nil
                              cancelButtonTitle:@"Well, eff."
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    // Old login code commented out below 
    /*
    if ([user.text isEqualToString:@"foo"] && [pass.text isEqualToString:@"foopass"]) {
        _login = true;
    }
    */
}

- (IBAction) loginPressed
{
    [self login];
    
    if ([user.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"No Username"
                              message: @"Please enter a username."
                              delegate: nil
                              cancelButtonTitle:@"Ok :("
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    else if ([pass.text isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"No Password"
                              message: @"Please enter a password."
                              delegate: nil
                              cancelButtonTitle:@"Ok :("
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    else if (_login == true) {
        ProblemViewController *problemVC = [[[ProblemViewController alloc] initWithNibName:@"ProblemViewController" bundle:nil] autorelease];
        [[self navigationController] pushViewController:problemVC animated:YES];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Authentication Failure"
                              message: @"You entered an incorrect username and/or password."
                              delegate: nil
                              cancelButtonTitle:@"I'll try again. :("
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
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
/*
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}
*/
@end
