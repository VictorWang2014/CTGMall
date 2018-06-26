//
//  CTGGoodsView.m
//  CTGMall
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsView.h"
#import "VCHeaders.h"

@interface CTGGoodsView ()


@end

@implementation CTGGoodsView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(10, 10, self.vcwidth-10*2, self.vcheight-50);
    self.titleLabel.frame = CGRectMake(10, self.vcheight-50, self.vcwidth, 25);
    self.subTitleLabel.frame = CGRectMake(10, self.vcheight-25, self.vcwidth, 25);

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.vcwidth-10*2, self.vcheight-50)];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:self.imageView];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.vcheight-50, self.vcwidth, 25)];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
//        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
        self.titleLabel.text = @"Apple iPhone X 深空灰色";
        [self addSubview:self.titleLabel];
        self.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.vcheight-25, self.vcwidth, 25)];
//        self.subTitleLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
        self.subTitleLabel.font = [UIFont systemFontOfSize:13];
        self.subTitleLabel.text = @"$888";
        [self addSubview:self.subTitleLabel];
    }
    return self;
}

@end
