//
//  DL3DViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DL3DViewController.h"
#import "DL3DTransitionMenuTableViewController.h"
#import "DL3DMainViewController.h"
#import "DLMenuModel.h"
#define menuWidth 80.0
@interface DL3DViewController ()<DL3DTransitionMenuTableViewControllerDelegate>

@property(strong,nonatomic) DL3DTransitionMenuTableViewController* menuViewController;
@property(strong,nonatomic) DL3DMainViewController* mainViewController;
@property(assign,nonatomic) BOOL isOpening;
@end

@implementation DL3DViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuViewController = [[DL3DTransitionMenuTableViewController alloc]init];
    self.mainViewController = [[DL3DMainViewController alloc]init];
    
    [self addChildViewController:self.mainViewController];
    [self.view addSubview:self.mainViewController.view];
    [self.mainViewController didMoveToParentViewController:self];
    
    [self addChildViewController:self.menuViewController];
    [self.view addSubview:self.menuViewController.view];
    [self.menuViewController didMoveToParentViewController:self];
    self.menuViewController.view.layer.anchorPoint = CGPointMake(1.0, 0);
    
    self.menuViewController.view.frame  =CGRectMake( -menuWidth, 0, menuWidth, self.view.frame.size.height );
    
    UIPanGestureRecognizer* panGeusture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:panGeusture];
    [self setToPercent:0.0];
    
    self.menuViewController.delegate = self;
}

-(void)handlePanGesture:(UIPanGestureRecognizer*)geusture
{
    CGPoint translation = [geusture translationInView:geusture.view.superview];
    CGFloat progress = translation.x / 80.0 * (self.isOpening ? 1.0 : -1.0);
    progress = MIN(MAX(progress, 0.0), 1.0);
    
    CGFloat isOpen = floor(self.menuViewController.view.frame.origin.x / 80);
    CGFloat targetProgress;
    
    switch (geusture.state) {
        case UIGestureRecognizerStateBegan:
            
            self.isOpening = isOpen == 1.0 ? false: true;
            break;
            
        case UIGestureRecognizerStateChanged:
            
//            [self setToPercent:(self.isOpening ? progress : (1.0 - progress))];
            
            break;
            
        case UIGestureRecognizerStateEnded:
            
        case UIGestureRecognizerStateCancelled:
            
        case UIGestureRecognizerStateFailed:
            break;
            
        default:
            break;
    }
    if (self.isOpening) {
        targetProgress = progress < 0.5 ? 0.0 : 1.0;
    } else {
        targetProgress = progress < 0.5 ? 1.0 : 0.0;
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self setToPercent:targetProgress];
    } completion:^(BOOL finished) {
        self.menuViewController.view.layer.shouldRasterize = false;
        
    }];
}

-(void)setToPercent:(CGFloat)percent
{
    CGRect mainRect = self.mainViewController.view.frame;
    mainRect.origin.x =  menuWidth * percent;
    self.mainViewController.view.frame = mainRect;
    
    //    CGRect menuRect = self.menuViewController.view.frame;
    //    menuRect.origin.x =  menuWidth * percent - menuWidth;
    //    self.menuViewController.view.frame = menuRect;
    
    self.menuViewController.view.alpha = MAX(0.2, percent);
    self.menuViewController.view.layer.transform = [self menuTransformForPercent:percent];
}

-(CATransform3D)menuTransformForPercent:(CGFloat)percent
{
    CATransform3D identity = CATransform3DIdentity;
    identity.m34 = -1.0/1000;
    CGFloat remainingPercent = 1.0 - percent;
    CGFloat angle = remainingPercent * -M_PI_2;
    CATransform3D rotationTransform = CATransform3DRotate(identity, angle, 0.0, 1.0, 0.0);
    CATransform3D translationTransform = CATransform3DMakeTranslation(menuWidth * percent, 0, 0);
    
    return CATransform3DConcat(rotationTransform,translationTransform);
}

-(void)didSelectWithModel:(DLMenuModel *)model andIndex:(NSInteger)index
{
    [self.mainViewController updateMainView:model.arrIcons[index] andColor:model.arrColors[index]];
}

@end
