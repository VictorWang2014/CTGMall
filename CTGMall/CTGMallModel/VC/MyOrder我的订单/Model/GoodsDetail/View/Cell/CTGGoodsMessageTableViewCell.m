//
//  CTGGoodsMessageTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/15.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsMessageTableViewCell.h"
#import "VCHeaders.h"

@interface CTGGoodsMessageTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UIButton *favoriteButton;

@end

@implementation CTGGoodsMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.text = @"测试商品1";
        [self addSubview:self.titleLabel];
        self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.titleLabel.vcmaxY, 200, 20)];
        self.moneyLabel.font = [UIFont systemFontOfSize:16];
        self.moneyLabel.textColor = [UIColor blackColor];
        self.moneyLabel.text = @"$88.8";
        [self addSubview:self.moneyLabel];
        self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.favoriteButton.frame = CGRectMake(self.vcwidth-17-10, 10, 17, 17);
        self.favoriteButton.backgroundColor = [UIColor redColor];
        self.favoriteButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        [self.favoriteButton addTarget:self action:@selector(favoriteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.favoriteButton];
    }
    return self;
}

- (void)favoriteButtonClick:(UIButton *)button {
    
}

@end
