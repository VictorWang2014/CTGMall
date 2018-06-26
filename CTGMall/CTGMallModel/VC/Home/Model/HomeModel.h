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

- (NSArray *)collectionCellClassArray;

@end
