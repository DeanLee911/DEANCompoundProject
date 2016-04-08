//
//  DLRedirectFromTbaleViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DLRedirectFromTbaleViewController.h"

@interface DLRedirectFromTbaleViewController ()

@end

@implementation DLRedirectFromTbaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

-(void)printSomethingParsedFormTableView:(NSString*)str
{
    UILabel* label = [[UILabel alloc]init];
    label.text = str;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
}


@end
