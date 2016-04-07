//
//  DLMenuModel.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DLMenuModel.h"

@implementation DLMenuModel
-(instancetype)init
{
    if ([super init]) {
        [self setupColors];
    }
    return self;
}

-(void)setupColors
{
    NSMutableArray* arrM = [NSMutableArray arrayWithCapacity:10];
    [arrM addObject:[UIColor redColor]];
    [arrM addObject:[UIColor blueColor]];
    [arrM addObject:[UIColor greenColor]];
    [arrM addObject:[UIColor darkGrayColor]];
    [arrM addObject:[UIColor yellowColor]];
    self.arrColors = [NSArray arrayWithArray:[arrM copy]];

    [arrM removeAllObjects];
    
    [arrM addObject:@"☎︎"];
    [arrM addObject:@"✉︎"];
    [arrM addObject:@"♻︎"];
    [arrM addObject:@"♞"];
    [arrM addObject:@"✾"];
    
    self.arrIcons = [NSArray arrayWithArray:[arrM copy]];
    
    [arrM removeAllObjects];
    
    [arrM addObject:@"phone"];
    [arrM addObject:@"mail"];
    [arrM addObject:@"cycle"];
    [arrM addObject:@"unkn"];
    
    self.arrTitles = [NSArray arrayWithArray:[arrM copy]];

}

@end
