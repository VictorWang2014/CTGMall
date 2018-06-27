//
//  HomeModel.m
//  CTGMall
//
//  Created by wangmingquan on 2018/5/13.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "HomeModel.h"
#import "HomeHeaders.h"
#import "CTGCommonDefine.h"

@implementation HomeModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self test];
    }
    return self;
}

#pragma mark - public
- (NSArray *)collectionCellClassArray {
    NSMutableArray *tmpArray = [NSMutableArray array];
    [self.listArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *ar = (NSArray *)obj;
        [ar enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *dic = (NSDictionary *)obj;
            NSString *classString = [dic objectForKey:CTGCellClassKey];
            if (classString.length > 0 && [classString isKindOfClass:[NSString class]]) {
                [tmpArray addObject:classString];
            }
        }];
    }];
    return tmpArray;
}

- (void)handleTitleBannerWithDictionary:(NSDictionary *)dictionary {
    
}

#pragma mark - private
- (void)test {
    NSArray *array = @[
                       @[
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGTitleScrollCollectionViewCell",
                             CTGScrollCellImageArrayKey:@[
                                                              @"http://mall.pad001.com/data/afficheimg/20161114nraqzu.jpg",
                                                              @"http://mall.pad001.com/data/afficheimg/20161114prfywc.jpg",
                                                              @"http://mall.pad001.com/data/afficheimg/20161114uxmgov.png",
                                                              @"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg"
                                                                     ],
                             CTGCellHeightKey:@(375)
                             }
                           ],
                       @[
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGNoticeScrollCollectionViewCell",
                             CTGScrollCellTitleArrayKey:@[
                                     @"今天星期一",
                                     @"今天星期二",
                                     @"今天星期三",
                                     @"今天星期四"
                                     ],
                             CTGCellHeightKey:@(45)
                             }
                           ],
                       @[
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGHomeDefaultTitleCollectionViewCell",
                             CTGCellTitleKey:@"今天星期四",
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             }
                           ],
                       @[
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGHomeDefaultTitleCollectionViewCell",
                             CTGCellTitleKey:@"今天星期四",
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             }
                           ],
                       @[
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGHomeDefaultTitleCollectionViewCell",
                             CTGCellTitleKey:@"今天星期四",
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             }
                           ],
                       @[
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGHomeDefaultTitleCollectionViewCell",
                             CTGCellTitleKey:@"今天星期四",
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             }
                           ],
                       @[
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGHomeDefaultTitleCollectionViewCell",
                             CTGCellTitleKey:@"今天星期四",
                             CTGCellHeightKey:@(45)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             },
                           @{CTGCellWidthKey:@"",
                             CTGCellClassKey:@"CTGGoodsCollectionViewCell",
                             CTGCellTitleKey:@"Apple iPhone X 深空灰色",
                             CTGCellImageUrlKey:@"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg",
                             CTGCellSubTitleKey:@"$888",
                             CTGCellHeightKey:@(220)
                             }
                           ]
                    ];
    self.listArray = [NSMutableArray arrayWithArray:array];
}

@end
