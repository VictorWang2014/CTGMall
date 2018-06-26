//
//  CTGRecoverPasswordModel.m
//  CTGMall
//
//  Created by admin on 2018/6/18.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGRecoverPasswordModel.h"
#import "CTGCommonDefine.h"

@implementation CTGRecoverPasswordModel

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
                       @[
                           @{CTGCellClassKey:@"CTGRecoverPTableViewCell",
                             CTGCellPlaceHoldKey:@"请输入手机号",
                             CTGCellClassFromNIB:@(YES),
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellClassKey:@"CTGRecoverPTableViewCell",
                             CTGCellPlaceHoldKey:@"请输入手机验证码",
                             CTGRecoverPasswordCellShowButtonKey:@(YES),
                             CTGCellClassFromNIB:@(YES),
                             CTGCellHeightKey:@(45)
                             }
                        ],
                       @[
                           @{CTGCellClassKey:@"CTGRecoverPTableViewCell",
                             CTGCellPlaceHoldKey:@"设置密码",
                             CTGCellClassFromNIB:@(YES),
                             CTGRecoverPasswordCellIsSecretKey:@(YES),
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellClassKey:@"CTGRecoverPTableViewCell",
                             CTGCellPlaceHoldKey:@"确认密码",
                             CTGRecoverPasswordCellIsSecretKey:@(YES),
                             CTGCellClassFromNIB:@(YES),
                             CTGCellHeightKey:@(45)
                             }
                           ]
                       ];
    self.listArray = [NSMutableArray arrayWithArray:array];
}

@end
