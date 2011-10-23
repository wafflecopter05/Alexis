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

bool _login = YES;

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
    
    // Imports the LoginInfo.plist file, which contains the login info.
    // NEED TO DO: Assign the values from the dictionary to the appropriate username/password variables.
   // WHY?!?!?!?!?!?!?!?!?! loginInfo = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LoginInfo" ofType:@"plist"]];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (BOOL) login
{
    _login = NO;
    if (user.text == @"foo" && pass.text == @"foopass") {
        _login = YES;
    }
    return _login;
}

- (IBAction) loginPressed
{
    if (_login == YES) {
        ProblemViewController *problemVC = [[[ProblemViewController alloc] initWithNibName:@"ProblemViewController" bundle:nil] autorelease];
        [window addSubview:problemVC.view];
    }
    else{
        username.text = @"Incorrect User Name";
        password.text = @"Incorrect Password";
        ProblemViewController *problemVC = [[[ProblemViewController alloc] initWithNibName:@"ProblemViewController" bundle:nil] autorelease];
        [window addSubview:problemVC.view];
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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ProblemViewController *problemVC = [[ProblemViewController alloc] initWithNibName:@"ProblemViewController" bundle:nil];
    
    [problemVC.view setFrame:[[UIScreen mainScreen] applicationFrame]];
    
    [self.window addSubview:problemVC.view];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
