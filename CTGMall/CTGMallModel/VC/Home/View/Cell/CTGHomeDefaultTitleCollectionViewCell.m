//
//  CTGHomeDefaultTitleCollectionViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGHomeDefaultTitleCollectionViewCell.h"
#import "VCHeaders.h"
#import "HomeHeaders.h"
#import "CTGCommonDefine.h"

@interface CTGHomeDefaultTitleCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CTGHomeDefaultTitleCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.text = @"销量排行";
        [self addSubview:self.titleLabel];
    }
    return self;
}


#pragma mark - setter
- (void)setDataDic:(NSDictionary *)dataDic {
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
        NSString *title = [dataDic objectForKey:CTGCellTitleKey];
        self.titleLabel.text = title;
    }
}

@end
