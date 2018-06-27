//
//  HomeModel.h
//  CTGMall
//
//  Created by wangmingquan on 2018/5/13.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HomeModel : NSObject

@property (nonatomic, strong) NSMutableArray *listArray;

// 获取首页collectionCell类型
- (NSArray *)collectionCellClassArray;

- (void)handleTitleBannerWithDictionary:(NSDictionary *)dictionary;

@end
