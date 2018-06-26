//
//  CTGMyOrderModel.m
//  CTGMall
//
//  Created by admin on 2018/6/5.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGMyOrderModel.h"
#import "VCHeaders.h"
#import "CTGCommonDefine.h"

@interface CTGMyOrderModel ()

@end

@implementation CTGMyOrderModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self test];
    }
    return self;
}

- (void)test {
    self.dataDic = [NSMutableDictionary dictionary];
    NSArray *array = @[
                       @{CTGCellClassKey:@"CTGOrderTableViewCell",
                         CTGCellTitleKey:@"测试商品",
                         CTGOrderCellNumbersKey:@"234234",
                         CTGCellClassFromNIB:@(YES),
                         CTGOrderCellPriceKey:@"$40",
                         CTGOrderCellGoodsNumbersKey:@"3",
                         CTGOrderCellCostKey:@"$120",
                         CTGOrderCellGoodsTagKey:@"等待卖家发货",
                         CTGCellHeightKey:@(180)
                         },
                       @{CTGCellClassKey:@"CTGOrderTableViewCell",
                         CTGCellTitleKey:@"测试商品",
                         CTGOrderCellNumbersKey:@"234234",
                         CTGCellClassFromNIB:@(YES),
                         CTGOrderCellPriceKey:@"$40",
                         CTGOrderCellGoodsNumbersKey:@"3",
                         CTGOrderCellCostKey:@"$120",
                         CTGOrderCellGoodsTagKey:@"等待卖家发货",
                         CTGCellHeightKey:@(180)
                         },
                       @{CTGCellClassKey:@"CTGOrderTableViewCell",
                         CTGCellTitleKey:@"测试商品",
                         CTGOrderCellNumbersKey:@"234234",
                         CTGCellClassFromNIB:@(YES),
                         CTGOrderCellPriceKey:@"$40",
                         CTGOrderCellGoodsNumbersKey:@"3",
                         CTGOrderCellGoodsTagKey:@"等待卖家发货",
                         CTGOrderCellCostKey:@"$120",
                         CTGCellHeightKey:@(180)
                         },
                       @{CTGCellClassKey:@"CTGOrderTableViewCell",
                         CTGCellTitleKey:@"测试商品",
                         CTGOrderCellNumbersKey:@"234234",
                         CTGCellClassFromNIB:@(YES),
                         CTGOrderCellPriceKey:@"$40",
                         CTGOrderCellGoodsTagKey:@"等待卖家发货",
                         CTGOrderCellGoodsNumbersKey:@"3",
                         CTGOrderCellCostKey:@"$120",
                         CTGCellHeightKey:@(180)
                         },
                       @{CTGCellClassKey:@"CTGOrderTableViewCell",
                         CTGCellTitleKey:@"测试商品",
                         CTGOrderCellNumbersKey:@"234234",
                         CTGCellClassFromNIB:@(YES),
                         CTGOrderCellPriceKey:@"$40",
                         CTGOrderCellGoodsNumbersKey:@"3",
                         CTGOrderCellGoodsTagKey:@"等待卖家发货",
                         CTGOrderCellCostKey:@"$120",
                         CTGCellHeightKey:@(180)
                         },
                       @{CTGCellClassKey:@"CTGOrderTableViewCell",
                         CTGCellTitleKey:@"测试商品",
                         CTGOrderCellNumbersKey:@"234234",
                         CTGCellClassFromNIB:@(YES),
                         CTGOrderCellPriceKey:@"$40",
                         CTGOrderCellGoodsNumbersKey:@"3",
                         CTGOrderCellGoodsTagKey:@"等待卖家发货",
                         CTGOrderCellCostKey:@"$120",
                         CTGCellHeightKey:@(180)
                         }
                       ];
    [self.dataDic setObject:array forKey:@(0)];
    [self.dataDic setObject:array forKey:@(1)];
    [self.dataDic setObject:array forKey:@(2)];
    [self.dataDic setObject:array forKey:@(3)];
    [self.dataDic setObject:array forKey:@(4)];
}

@end
