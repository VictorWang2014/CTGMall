//
//  CTGComfirmOrderModel.m
//  CTGMall
//
//  Created by admin on 2018/6/11.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGComfirmOrderModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"

@implementation CTGComfirmOrderModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self test];
    }
    return self;
}

- (void)test {
    NSArray *array = @[
                       @{
                           CTGCellClassKey:@"CTGConfirmOrderNameTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellHeightKey:@(70)
                           },
                       @{
                           CTGCellClassKey:@"CTGConfirmOrderDetailTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellHeightKey:@(337)
                           },
                       @{
                           CTGCellClassKey:@"CTGConfirmOrderEndTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellHeightKey:@(94)
                           }
                      ];
    self.listArray = [NSMutableArray arrayWithArray:array];
}

@end
