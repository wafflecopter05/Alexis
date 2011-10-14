//
//  LoginViewController.h
//  Alexis
//
//  Created by Blake Tucker on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController {
    UILabel *username, *password;
    UITextField *user,  *pass;
    NSString *tempuser, *temppass;
}

@end
