//
//  CTGTitleScrollCollectionViewCell.h
//  CTGMall
//
//  Created by admin on 2018/5/8.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CTGTitleScrollCellDelegate <NSObject>

// 轮播图滚动点击
- (void)titleScrollSelectWithData:(id)data;

// 菜单按钮点击
- (void)titleButtonClickAtIndex:(int)index;

@end


@interface CTGTitleScrollCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSDictionary *dataDic;// 数据源

@end
