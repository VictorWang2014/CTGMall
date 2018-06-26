//
//  CTGNoticeScrollCollectionViewCell.h
//  CTGMall
//
//  Created by admin on 2018/5/11.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CTGNoticeScrollCellDelegate <NSObject>

// 轮播图滚动点击
- (void)noticeScrollSelectWithData:(id)data;

@end

@interface CTGNoticeScrollCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSDictionary *dataDic;// 数据源

@end
