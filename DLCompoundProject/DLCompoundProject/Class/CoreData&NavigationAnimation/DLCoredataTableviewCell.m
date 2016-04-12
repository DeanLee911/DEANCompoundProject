//
//  DLCoredataTableviewCell.m
//  DLCompoundProject
//
//  Created by Dean Lee on 16/4/8.
//  Copyright © 2016年 Dean Lee. All rights reserved.
//

#import "DLCoredataTableviewCell.h"

@implementation DLCoredataTableviewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

-(void)drawMyCellWithImage:(UIImage*)image andTitle:(NSString*)name
{
    UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
    [self.contentView addSubview:imageView];
    
    UILabel* label = [[UILabel alloc]init];
    label.text = name;
    [self.contentView addSubview:label];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.and.bottom.equalTo(@(5));
        make.width.equalTo(self.mas_height);
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(imageView.mas_trailing);
        make.top.and.trailing.and.bottom.equalTo(@(5));

    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
