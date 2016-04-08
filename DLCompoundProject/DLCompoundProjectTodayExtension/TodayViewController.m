//
//  TodayViewController.m
//  DLCompoundProjectTodayExtension
//
//  Created by Dean Lee on 16/4/8.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPreferredContentSize:CGSizeMake(0, 50)];
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(printTime) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void)printTime
{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];

    self.timeLabel.text = dateString;
    self.timeLabel.textColor = [UIColor whiteColor];
    self.timeLabel.font = [UIFont systemFontOfSize:20.0];
}

- (IBAction)enterTheApp {

    NSURL *url = [NSURL URLWithString:@"myApp://"];
    
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        NSLog(@"sss");
    }];
}

-(UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData


    completionHandler(NCUpdateResultNewData);
}

@end
