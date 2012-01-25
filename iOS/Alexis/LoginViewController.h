//
//  LoginViewController.h
//  Alexis
//
//  Created by Blake Tucker on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemViewController.h"
#import "AlexisAppDelegate.h"
#import "UserChoiceController.h"

// NEEDS CLARIFICATION: What are username, password, tempuser, temppass being used for? I'm assuming user/pass
// is for text boxes (obviously), and tempuser/temppass are from the imported dictionary file? What is
// username/password for?

@interface LoginViewController : UIViewController <UIAlertViewDelegate> {
    IBOutlet UILabel *username, *password;
    IBOutlet UITextField *user,  *pass, *userBox, *passBox;
    NSString *tempuser, *temppass;
    NSMutableDictionary *loginInfo;
    BOOL _login;
}    
    
-(void) login;
-(IBAction) loginPressed;
-(IBAction) hideKeyboard;
-(IBAction) addUser;

// IN XIB: In File's Owner, I linked user/pass to the text fields.
@property (nonatomic, retain) UILabel *username;
@property (nonatomic, retain) UILabel *password;
@property (nonatomic, retain) IBOutlet UITextField *user;
@property (nonatomic, retain) IBOutlet UITextField *pass;
@property (nonatomic, retain) IBOutlet UITextField *userBox;
@property (nonatomic, retain) IBOutlet UITextField *passBox;
@property (nonatomic, retain) NSString *tempuser;
@property (nonatomic, retain) NSString *temppass;
@property (nonatomic, retain) NSMutableDictionary *loginInfo;
@property (nonatomic, readwrite) BOOL _login;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
