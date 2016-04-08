//
//  DLStackViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/8.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DLStackViewController.h"

@interface DLStackViewController ()

@property (assign, nonatomic)   BOOL isUserClick;
@property (weak, nonatomic) IBOutlet UIButton *hiddenBtn;
@property (weak, nonatomic) IBOutlet UIStackView *changeTheStackViewAxis;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *titles;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *content;

@end

@implementation DLStackViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.isUserClick = YES;

    for (UILabel* label in self.titles)
    {
        label.text   = @"Hello My World";
    }

    UILabel* label1  = self.content[0];
    UILabel* label2  = self.content[1];
    UILabel* label3  = self.content[2];

    label1.text      = [NSString stringWithFormat:@"%s",helloStr2];
    label2.text      = [NSString stringWithFormat:@"%s",helloStr];
    label3.text      = [NSString stringWithFormat:@"%s",helloStr2];
}

- (IBAction)backToLastVC
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss");
    }];
}

- (IBAction)hideBtnClick
{
    UILabel* label = self.content[1];
    
    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:1 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        label.hidden = _isUserClick;
        [self.hiddenBtn setTitle:(_isUserClick ? @"Show" : @"Hide") forState:UIControlStateNormal];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.changeTheStackViewAxis.axis = _isUserClick ? UILayoutConstraintAxisHorizontal : UILayoutConstraintAxisVertical;
        }];
    }];

    _isUserClick = !_isUserClick;
}

@end
