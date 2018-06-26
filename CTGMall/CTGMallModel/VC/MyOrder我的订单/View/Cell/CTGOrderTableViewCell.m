//
//  CTGOrderTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/31.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGOrderTableViewCell.h"
#import "VCHeaders.h"
#import "CTGCommonDefine.h"

@interface CTGOrderTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *numbersLabel;
@property (strong, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (strong, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *goodsPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *goodsNumbersLabel;
@property (strong, nonatomic) IBOutlet UILabel *goodsCostLabel;
@property (strong, nonatomic) IBOutlet UILabel *goodsTagLabel;


@end


@implementation CTGOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)fillData:(NSDictionary *)data {
    if (![data isKindOfClass:[NSDictionary class]]) {
        return;
    }
    self.numbersLabel.text = [data objectForKey:CTGOrderCellNumbersKey];
    [self.goodsImageView sd_setImageWithURL:[data objectForKey:CTGCellImageUrlKey]];
    self.goodsNameLabel.text = [data objectForKey:CTGCellTitleKey];
    self.goodsPriceLabel.text = [data objectForKey:CTGOrderCellPriceKey];
    self.goodsNumbersLabel.text = [data objectForKey:CTGOrderCellGoodsNumbersKey];
    self.goodsCostLabel.text = [data objectForKey:CTGOrderCellCostKey];
    self.goodsTagLabel.text = [data objectForKey:CTGOrderCellGoodsTagKey];
}

@end
