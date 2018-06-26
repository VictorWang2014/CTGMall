//
//  CTGNoticeScrollView.h
//  CTGMall
//
//  Created by admin on 2018/5/11.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

// 公告轮播图
@interface CTGNoticeScrollView : UIView

@property (nonatomic, strong) NSMutableArray *listArray;// 填充数据

// 数据刷新
- (void)reloadData;

@end
