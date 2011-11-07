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
}

-(IBAction) hideKeyboard;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end
