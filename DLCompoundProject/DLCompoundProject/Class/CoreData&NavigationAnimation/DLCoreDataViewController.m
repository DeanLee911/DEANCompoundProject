//
//  DLCoreDataViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/8.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DLCoreDataViewController.h"
#import "DLCoredataTableviewCell.h"

@interface DLCoreDataViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DLCoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    DLCoredataTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[DLCoredataTableviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }

    
    [cell drawMyCellWithImage:[UIImage imageNamed:@"line"] andTitle:@"123"];
//    cell.textLabel.backgroundColor = [UIColor clearColor];
//    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:36.0];
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;
//    cell.textLabel.text = @"123";
    
    return cell;
}

@end
