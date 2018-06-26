//
//  CTGGoodsCollectionViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsCollectionViewCell.h"
#import "CTGGoodsView.h"
#import "HomeHeaders.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"

@interface CTGGoodsCollectionViewCell ()

@property (nonatomic, strong) CTGGoodsView *goodsView;

@end

@implementation CTGGoodsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.goodsView = [[CTGGoodsView alloc] initWithFrame:self.bounds];
        [self addSubview:self.goodsView];
    }
    return self;
}


#pragma mark - setter
- (void)setDataDic:(NSDictionary *)dataDic {
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
        NSString *title = [dataDic objectForKey:CTGCellTitleKey];
        NSString *subTitle = [dataDic objectForKey:CTGCellSubTitleKey];
        NSString *imageUrl = [dataDic objectForKey:CTGCellImageUrlKey];
        [self.goodsView.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        self.goodsView.titleLabel.text = title;
        self.goodsView.subTitleLabel.text = subTitle;
    }
}

@end
