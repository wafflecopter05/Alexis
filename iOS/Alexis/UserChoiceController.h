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
    
    ProblemViewController *ProblemViewController;
    PictureProblemViewController *PictureProblemViewController;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *viewArray;
@property (nonatomic, retain) ProblemViewController *ProblemViewController;
@property (nonatomic, retain) PictureProblemViewController *PictureProblemViewController;

-(void) populateViewArray;

@end
