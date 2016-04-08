//
//  DL3DMainViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DL3DMainViewController.h"
#import "DLStackViewController.h"

@interface DL3DMainViewController ()

@property(strong,nonatomic) IBOutlet UIButton* imageButton;

@end

@implementation DL3DMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    self.imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.imageButton.titleLabel.font = [UIFont systemFontOfSize:100];
    [self.imageButton addTarget:self action:@selector(modalAStackViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.imageButton];
    
    [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.and.centerY.equalTo(self.view);
        make.width.and.height.equalTo(@(300));
    }];
}

-(void)updateMainView:(NSString* )string andColor:(UIColor*)color
{
    [self.imageButton setTitle:string forState:UIControlStateNormal];
    self.view.backgroundColor = color;
}

-(void)modalAStackViewController
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DLStackViewController *stackVC = (DLStackViewController*)[storyboard instantiateViewControllerWithIdentifier:@"stackView"];
    [self presentViewController:stackVC animated:YES completion:nil];
}

@end
