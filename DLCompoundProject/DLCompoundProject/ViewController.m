//
//  ViewController.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/6.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "ViewController.h"
#import "DLCollectionView.h"
#import "DLRedirectFromTbaleViewController.h"
#import "DLCollectionViewCell.h"
#import "DLTransitionAnimator.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>
{
    long selectRow;
}

@property (strong, nonatomic) IBOutlet DLCollectionView *navigateCollectionView;
@property (weak, nonatomic) IBOutlet DLCollectionView *detailCollectionView;
@property (strong,nonatomic) UIImageView * imageView;
@property (strong,nonatomic) NSMutableArray* tableViewData;
@property (strong,nonatomic) DLTransitionAnimator* transition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.navigateCollectionView.delegate = self;
    self.navigateCollectionView.dataSource = self;
    [self.navigateCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    self.detailCollectionView.delegate = self;
    self.detailCollectionView.dataSource = self;
    [self.detailCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableViewData = [[NSMutableArray alloc]init];
    
    _transition = [[DLTransitionAnimator alloc]init];
}

#pragma mark - collectionView
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.navigateCollectionView) {
        
        return CGSizeMake(self.navigateCollectionView.frame.size.height, self.navigateCollectionView.frame.size.height);
    }
    return CGSizeMake(self.detailCollectionView.frame.size.width, self.detailCollectionView.frame.size.height);
}

-(NSInteger)numberOfSections
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell* )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    if (collectionView == self.navigateCollectionView)
    {
        //        cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigateCollectionView.frame.size.height, self.navigateCollectionView.frame.size.height)];
        label.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        if (selectRow == indexPath.row) {
            
            self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.navigateCollectionView.frame.size.height, self.navigateCollectionView.frame.size.height)];
            self.imageView.image = [UIImage imageNamed:@"sss"];
            self.imageView.hidden = YES;
            [cell.contentView addSubview:self.imageView];
        }
        [cell.contentView addSubview:label];
    }
    else
    {
        CGFloat minY = CGRectGetMaxY(self.navigateCollectionView.frame);
        CGFloat maxY = CGRectGetMaxY(self.detailCollectionView.frame);
        CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, maxY - minY);
        UITableView* tableView = [[UITableView alloc]initWithFrame:rect];
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [cell.contentView addSubview:tableView];
        
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.navigateCollectionView) {
        selectRow = indexPath.row;
        [self.navigateCollectionView reloadData];
    }
}

//two collectionview combine
- (NSIndexPath *)curIndexPath {
    NSArray *indexPaths = [self.detailCollectionView indexPathsForVisibleItems];
    NSIndexPath *curIndexPath = nil;
    NSInteger curzIndex = 0;
    for (NSIndexPath *path in indexPaths.objectEnumerator) {
        UICollectionViewLayoutAttributes *attributes = [self.detailCollectionView layoutAttributesForItemAtIndexPath:path];
        if (!curIndexPath) {
            curIndexPath = path;
            curzIndex = attributes.zIndex;
            continue;
        }
        if (attributes.zIndex > curzIndex) {
            curIndexPath = path;
            curzIndex = attributes.zIndex;
        }
    }
    return curIndexPath;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *curIndexPath = [self curIndexPath];
    if (indexPath.row == curIndexPath.row) {
        return YES;
    }
    
    [self.detailCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    return NO;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableSampleIdentifier = @"tableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    int tempNum = rand();
    cell.textLabel.text = [NSString stringWithFormat:@"%d",tempNum];
    
    [self.tableViewData addObject:@(tempNum)];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLRedirectFromTbaleViewController* vc = [[DLRedirectFromTbaleViewController alloc]init];
    [vc printSomethingParsedFormTableView:[NSString stringWithFormat:@"%@",self.tableViewData[indexPath.row]]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    self.transition.operation = operation;
    return self.transition;
}

@end
