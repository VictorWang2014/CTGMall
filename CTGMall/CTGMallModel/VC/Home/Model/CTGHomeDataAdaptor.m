//
//  CTGHomeDataAdaptor.m
//  CTGMall
//
//  Created by admin on 2018/6/27.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGHomeDataAdaptor.h"

@implementation CTGHomeDataAdaptor

+ (id)adaptorTitleBannerWithJsonObject:(id)object {
//    NSArray *array =
    if ([object isKindOfClass:NSDictionary.class]) {
        NSDictionary *dic = (NSDictionary *)object;
        NSArray *array = dic[@"banners"];
        
    }
    return nil;
}

@end
