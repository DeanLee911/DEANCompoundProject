//
//  DLRedirectFromTbaleViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/7.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DLRedirectFromTbaleViewController.h"
#import "DLBubbleTableView.h"

@interface DLRedirectFromTbaleViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* arr;
@property(nonatomic,assign)int numOfEmptyData;
@end

@implementation DLRedirectFromTbaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.bottom.equalTo(self.view);
        make.width.equalTo(@(300));
        make.height.equalTo(@(200));
    }];
    _arr = [NSMutableArray array];
    NSDictionary* dic = @{
                          @"aa":@"\n",
                          @"bb":@"bb"
                          };

    _numOfEmptyData = 5;
    for (int i = 0; i<_numOfEmptyData; i++)
    {
        [_arr addObject:dic];
    }
    
    [self.tableView reloadData];

}

-(void)printSomethingParsedFormTableView:(NSString*)str
{    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);

    }];
}

-(void)btn
{
    _numOfEmptyData -= 1;
    if (_numOfEmptyData > 0) {
        
        [_arr removeObjectAtIndex:0];
    }
    NSLog(@"%d",_numOfEmptyData);
    NSString* s = [NSString stringWithFormat:@"%d",rand()];
    NSDictionary* dic = @{
      @"aa":s,
      @"bb":@"summericons_100px_02"
    };
    [_arr addObject:dic];
    
    
    NSIndexPath *lastRow = [NSIndexPath indexPathForRow:([self.arr count] - 1) inSection:0];
    if (_numOfEmptyData <= 0) {
        NSIndexPath *lastRow1 = [NSIndexPath indexPathForRow:([self.arr count]-1) inSection:0];

        [self.tableView insertRowsAtIndexPaths:@[lastRow1] withRowAnimation:2];
    }
    else
    {
        [self.tableView reloadData];
    }
    [self.tableView scrollToRowAtIndexPath:lastRow atScrollPosition:UITableViewScrollPositionNone animated:NO];
}
-(NSInteger)numberOfSections
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableSampleIdentifier = @"tableViewCellBll";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }

//    int tempNum = rand();
//    cell.textLabel.text = [NSString stringWithFormat:@"%d",1];
    NSDictionary* dic = _arr[indexPath.row];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:dic[@"bb"]]];
    [cell.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(cell.contentView);
        make.top.equalTo(cell.contentView).with.offset(5);
        make.width.and.height.equalTo(@(20));
    }];
    
    UILabel* l = [[UILabel alloc]init];
    l.numberOfLines = 0;
    l.text = dic[@"aa"];
    [cell.contentView  addSubview:l];
    
    [l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(imageView.mas_trailing);
        make.top.and.trailing.equalTo(cell.contentView).with.offset(5);

    }];

    return cell;
}
//- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
//{
//
//}

@end
