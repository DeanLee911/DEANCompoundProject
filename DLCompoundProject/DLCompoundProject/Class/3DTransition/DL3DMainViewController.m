//
//  DL3DMainViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DL3DMainViewController.h"
#import "DL3DTransitionMenuTableViewController.h"
#import "DLMenuModel.h"
@interface DL3DMainViewController ()<DL3DTransitionMenuTableViewControllerDelegate>

@property(strong, nonatomic)DL3DTransitionMenuTableViewController *tableView;
@property(strong,nonatomic)UIImageView* imageView;

@end

@implementation DL3DMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[DL3DTransitionMenuTableViewController alloc]init];
    self.tableView.delegate = self;
    self.view.backgroundColor = [UIColor redColor];
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.imageView];
}

-(void)didSelectWithModel:(DLMenuModel *)model andIndex:(NSInteger)index
{
    self.imageView.image = model.arrIcons[index];
}

@end
