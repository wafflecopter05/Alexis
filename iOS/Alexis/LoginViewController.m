//
//  LoginViewController.m
//  Alexis
//
//  Created by Blake Tucker on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController
@synthesize user, pass, username, password, userBox, passBox, temppass, tempuser, loginInfo, _login, window;

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
    self.loginInfo = [[[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LoginInfo" ofType:@"plist"]] autorelease];
    
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
        UserChoiceController *choiceVC = [[[UserChoiceController alloc] initWithNibName:@"UserChoiceController" bundle:nil] autorelease];
        [[self navigationController] pushViewController:choiceVC animated:YES];
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

-(IBAction) addUser
{
    
    UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:@"Add User" 
                                                     message:@"\n\n\n" // makes room for text boxes
                                                    delegate:self 
                                           cancelButtonTitle:@"Cancel" 
                                           otherButtonTitles:@"Enter", nil];
    
    userBox = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)]; 
    [userBox setBackgroundColor:[UIColor whiteColor]];
    [userBox setPlaceholder:@"username"];
    [prompt addSubview:userBox];
    
    passBox = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 85.0, 260.0, 25.0)]; 
    [passBox setBackgroundColor:[UIColor whiteColor]];
    [passBox setPlaceholder:@"password"];
    [passBox setSecureTextEntry:YES];
    [prompt addSubview:passBox];
    
    // set place
    [prompt show];
    [prompt release];
    
    // set cursor and show keyboard
    [userBox becomeFirstResponder];
    
    // Add check for if username exists already. If it does, return a UIAlert and return to dialog box. TO DO.
    // Don't forget to release userBox and passBox :)
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex == 1) {
        if(![[loginInfo objectForKey:(userBox.text)] isEqual:nil]){
            [loginInfo setValue:passBox.text forKey:userBox.text];
            UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success!" 
                                                             message:@"The user was added successfully!" // makes room for text boxes
                                                            delegate:nil 
                                                   cancelButtonTitle:@"Woo! :)"
                                                   otherButtonTitles:nil];
            [success show];
            [success release];
            [userBox setText:@""];
            [passBox setText:@""];
        }
        else
        {
            UIAlertView *failure = [[UIAlertView alloc] initWithTitle:@"Failure!" 
                                                              message:@"That username already exists..." // makes room for text boxes
                                                             delegate:nil 
                                                    cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:nil];
            [failure show];
            [failure release];
            [userBox setText:@""];
            [passBox setText:@""];
        }
    }
    else
    {
    }
    
    
}

@end
