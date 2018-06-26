//
//  CTGGoodsIntroduceTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/16.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsIntroduceTableViewCell.h"
#import "VCHeaders.h"
#import "CTGCommonDefine.h"
#import "CTGGoodsHeads.h"

@interface CTGGoodsIntroduceTableViewCell ()



@end

@implementation CTGGoodsIntroduceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.vcwidth-20, self.vcheight)];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.textColor = [UIColor blackColor];
        self.label.text = @"商品介绍";
        [self addSubview:self.label];
    }
    return self;
}

#pragma mark - setter
- (void)setDataDic:(NSDictionary *)dataDic {
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
        NSString *title = [dataDic objectForKey:CTGCellTitleKey];
        self.label.text = title;
        BOOL isAligentLeft = [[dataDic objectForKey:CTGGoodsCellIsLeftAligentKey] boolValue];
        self.label.textAlignment = isAligentLeft?NSTextAlignmentLeft:NSTextAlignmentCenter;
    }
}

@end
