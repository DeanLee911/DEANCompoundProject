//
//  DL3DTransitionMenuTableViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DL3DTransitionMenuTableViewController.h"
#import "DLMenuModel.h"
@interface DL3DTransitionMenuTableViewController ()

@property(strong,nonatomic)DLMenuModel *menuModel;

@end

@implementation DL3DTransitionMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuModel = [[DLMenuModel alloc]init];
    

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuModel.arrColors.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:36.0];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = self.menuModel.arrIcons[indexPath.row];
    cell.contentView.backgroundColor = self.menuModel.arrColors[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 64.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(didSelectWithModel:andIndex:)]) {
        
        [self.delegate didSelectWithModel:self.menuModel andIndex:indexPath.row];
    }
}

@end
