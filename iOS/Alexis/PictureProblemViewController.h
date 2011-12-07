//
//  PictureProblemViewController.h
//  Alexis
//
//  Created by srrobin4 on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PictureProblemViewController : UIViewController {
    IBOutlet UITextField *answer;
}


@property (nonatomic, retain) IBOutlet UITextField *answer;
-(IBAction) hideKeyboard;
-(IBAction) submitAnswer;
-(IBAction) backButton;
@end
