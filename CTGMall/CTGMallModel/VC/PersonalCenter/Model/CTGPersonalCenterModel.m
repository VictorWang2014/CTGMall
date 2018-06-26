//
//  CTGPersonalCenterModel.m
//  CTGMall
//
//  Created by admin on 2018/6/3.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGPersonalCenterModel.h"
#import "CTGCommonDefine.h"

@implementation CTGPersonalCenterModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self testData];
    }
    return self;
}

- (void)testData {
    self.listArray = [NSMutableArray array];
    NSArray *array = @[
                       @{CTGCellClassKey:@"CTGPersonalInfoTableViewCell",
                         CTGCellTitleKey:@"15895032325",
                         CTGCellSubTitleKey:@"默认等级",
                         CTGCellClassFromNIB:@(YES),
                         CTGCellHeightKey:@(110)
                         },
                       @{CTGCellClassKey:@"CTGPersonalOrderTableViewCell",
                         CTGCellClassFromNIB:@(YES),
                         CTGCellHeightKey:@(52)
                         },
                       @{CTGCellClassKey:@"CTGPersonalOrderSetTableViewCell",
                         CTGCellHeightKey:@(95)
                         },
                       @{CTGCellClassKey:@"CTGPersonalTagTableViewCell",
                         CTGCellClassFromNIB:@(YES),
                         CTGCellHeightKey:@(48),
                         CTGCellTitleKey:@"我的收藏"
                         },
                       @{CTGCellClassKey:@"CTGPersonalTagTableViewCell",
                         CTGCellClassFromNIB:@(YES),
                         CTGCellHeightKey:@(48),
                         CTGCellTitleKey:@"收货地址"
                         },
                       @{CTGCellClassKey:@"CTGPersonalTagTableViewCell",
                         CTGCellClassFromNIB:@(YES),
                         CTGCellHeightKey:@(48),
                         CTGCellTitleKey:@"我的积分"
                         }
                       ];
    self.listArray = [NSMutableArray arrayWithArray:array];
}

@end
