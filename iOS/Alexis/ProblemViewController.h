//
//  ProblemViewController.h
//  Alexis
//
//  Created by Blake Tucker on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ProblemViewController : UIViewController {
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *answer;
}

-(IBAction) hideKeyboard;
-(IBAction) submitAnswer;
-(IBAction) backButton;
-(IBAction) clearTextBoxes;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UITextField *answer;
@end
