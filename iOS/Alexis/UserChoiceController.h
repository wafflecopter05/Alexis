//
//  UserChoiceController.h
//  Alexis
//
//  Created by brtucker on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemViewController.h"
#import "PictureProblemViewController.h"


@interface UserChoiceController : UIViewController {
    IBOutlet UITableView *tableView;
             NSMutableArray *viewArray;
    
    IBOutlet ProblemViewController *ProblemViewController;
    IBOutlet PictureProblemViewController *PictureProblemViewController;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *viewArray;
@property (nonatomic, retain) IBOutlet ProblemViewController *ProblemViewController;
@property (nonatomic, retain) IBOutlet PictureProblemViewController *PictureProblemViewController;

-(void) populateViewArray;

@end
