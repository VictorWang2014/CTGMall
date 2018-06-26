//
//  CTGAddressModel.m
//  CTGMall
//
//  Created by admin on 2018/6/13.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGAddressModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"

@implementation CTGAddressModel

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
                           CTGCellClassKey:@"CTGAddressTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellHeightKey:@(100)
                           },
                       @{
                           CTGCellClassKey:@"CTGAddressTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellHeightKey:@(100)
                           },
                       @{
                           CTGCellClassKey:@"CTGAddressTableViewCell",
                           CTGCellClassFromNIB:@(YES),
                           CTGCellHeightKey:@(100)
                           }
                       ];
    self.listArray = [NSMutableArray arrayWithArray:array];
}

@end
