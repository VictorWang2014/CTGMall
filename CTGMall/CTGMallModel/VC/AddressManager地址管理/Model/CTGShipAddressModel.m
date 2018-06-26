//
//  CTGShipAddressModel.m
//  CTGMall
//
//  Created by admin on 2018/6/18.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGShipAddressModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"

@implementation CTGShipAddressModel


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
                           CTGCellClassKey:@"CTGShipAddressTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellTitleKey:@"联系姓名",
                           CTGCellSubTitleKey:@"填写姓名",
                           CTGCellHeightKey:@(44)
                           },
                       @{
                           CTGCellClassKey:@"CTGShipAddressTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellTitleKey:@"联系电话",
                           CTGCellSubTitleKey:@"填写手机号",
                           CTGCellHeightKey:@(44)
                           },
                       @{
                           CTGCellClassKey:@"CTGShipAddressSelectTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellHeightKey:@(44)
                           },
                       @{
                           CTGCellClassKey:@"CTGShipAddressTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellTitleKey:@"详细地址",
                           CTGCellSubTitleKey:@"填写详细地址",
                           CTGCellHeightKey:@(44)
                           }
                       ];
    self.listArray = [NSMutableArray arrayWithArray:array];
}

@end
