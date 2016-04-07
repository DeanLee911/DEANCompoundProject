//
//  DL3DTransitionMenuTableViewController.h
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DLMenuModel;

@protocol DL3DTransitionMenuTableViewControllerDelegate <NSObject>

-(void)didSelectWithModel:(DLMenuModel*)model andIndex:(NSInteger)index;

@end

@interface DL3DTransitionMenuTableViewController : UITableViewController

@property(weak,nonatomic)id<DL3DTransitionMenuTableViewControllerDelegate> delegate;

@end
