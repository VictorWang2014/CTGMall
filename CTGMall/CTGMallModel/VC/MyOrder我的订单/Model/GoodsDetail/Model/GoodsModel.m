//
//  GoodsModel.m
//  CTGMall
//
//  Created by admin on 2018/5/15.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "GoodsModel.h"
#import "CTGGoodsHeads.h"
#import "CTGCommonDefine.h"

@implementation GoodsModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self test];
    }
    return self;
}

- (void)test {
    NSArray *array = @[
                       @[
                           @{CTGCellClassKey:@"CTGGoodsTitleScrollTableViewCell",
                             CTGScrollCellImageArrayKey:@[
                                     @"http://mall.pad001.com/data/afficheimg/20161114nraqzu.jpg",
                                     @"http://mall.pad001.com/data/afficheimg/20161114prfywc.jpg",
                                     @"http://mall.pad001.com/data/afficheimg/20161114uxmgov.png",
                                     @"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg"
                                     ],
                             CTGCellHeightKey:@(370)
                             },
                           @{CTGCellClassKey:@"CTGGoodsMessageTableViewCell",
                             CTGGoodsCellMessageMoneyKey:@"$89.8",
                             CTGGoodsCellIsFavorityKey:@(NO),
                             CTGCellTitleKey:@"今天星期四",
                             CTGCellHeightKey:@(80)
                             }
                           ],
                       @[
                           @{CTGCellClassKey:@"CTGGoodsNumbersTableViewCell",
                             CTGGoodsCellBuyNumbersKey:@"1",
                             CTGCellHeightKey:@(58)
                             }
                           ],
                       @[
                           @{CTGCellClassKey:@"CTGGoodsIntroduceTableViewCell",
                             CTGCellTitleKey:@"商品介绍",
                             CTGGoodsCellIsLeftAligentKey:@(NO),
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellClassKey:@"CTGGoodsIntroduceTableViewCell",
                             CTGCellTitleKey:@"没有产品详情",
                             CTGGoodsCellIsLeftAligentKey:@(YES),
                             CTGCellHeightKey:@(45)
                             }
                           ]
                       ];
    self.listArray = [NSMutableArray arrayWithArray:array];
}

@end
