//
//  CTGGoodsBottomView.m
//  CTGMall
//
//  Created by admin on 2018/5/16.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsBottomView.h"
#import "VCHeaders.h"

@interface CTGGoodsBottomView ()

@property (nonatomic, strong) UIButton *shopCartButton;
@property (nonatomic, strong) UIButton *addShopCartButton;
@property (nonatomic, strong) UIButton *buyButton;

@end


@implementation CTGGoodsBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.shopCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shopCartButton.frame = CGRectMake(0, 0, 75, self.vcheight);
        self.shopCartButton.backgroundColor = [UIColor redColor];
        [self.shopCartButton addTarget:self action:@selector(shopCartButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.shopCartButton];

        self.addShopCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.addShopCartButton.frame = CGRectMake(self.shopCartButton.vcoriginX, 0, (self.vcwidth-self.shopCartButton.vcoriginX)/2, self.vcheight);
        self.addShopCartButton.backgroundColor = [UIColor redColor];
        [self.addShopCartButton addTarget:self action:@selector(addShopCartButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.addShopCartButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        [self addSubview:self.addShopCartButton];

        self.buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buyButton.frame = CGRectMake(self.addShopCartButton.vcoriginX, 0, (self.vcwidth-self.shopCartButton.vcoriginX)/2, self.vcheight);
        self.buyButton.backgroundColor = [UIColor darkGrayColor];
        [self.buyButton addTarget:self action:@selector(buyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.buyButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        [self addSubview:self.buyButton];
    }
    return self;
}

- (void)shopCartButtonClick:(UIButton *)button {
    
}

- (void)addShopCartButtonClick:(UIButton *)button {
    
}

- (void)buyButtonClick:(UIButton *)button {
    
}

@end
