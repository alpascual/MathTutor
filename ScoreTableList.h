//
//  ScoreTableList.h
//  MathTutor
//
//  Created by Albert Pascual on 9/22/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreTableList : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *Userlist;
    UIButton *buttonClose;
    UITableView *tableView;
}

@property (nonatomic, strong) NSMutableArray *Userlist;
@property (nonatomic, strong) IBOutlet UIButton *buttonClose;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

- (IBAction)closePressed:(id)sender;

@end
