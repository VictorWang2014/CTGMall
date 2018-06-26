//
//  VCLoopScrollView.h
//  TempTestLib
//
//  Created by wangmingquan on 2018/5/5.
//  Copyright © 2018年 wangmingquan. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, VCLoopScrollDirection) {
    VCLoopScrollDirectionHorizon,   // 横向滚动
    VCLoopScrollDirectionVertical,  // 竖向滚动
};

typedef NS_ENUM(NSUInteger, VCLoopScrollMoveType) {
    VCLoopScrollMoveTypeNone,
    VCLoopScrollMoveTypeLeft,       // 移动左边的view到右边，即往左滑
    VCLoopScrollMoveTypeRight,      // 移动右边的view到左边，即往右滑
};

@protocol VCLoopScrollDelegate <NSObject>

@required
- (UIView *)pageViewInitialWithFrame:(CGRect)frame atIndex:(int)index;

- (void)pageView:(UIView *)pageView fillDataAtIndex:(int)index;

@optional
- (void)pageView:(UIView *)pageView didShowAtIndex:(int)index;

@end


@interface VCLoopScrollView : UIView

@property (nonatomic, assign) VCLoopScrollDirection scrollDirection;// 滚动方向

@property (nonatomic, assign) id <VCLoopScrollDelegate> delegate;// 代理对象

@property (nonatomic, assign) int totalCount;// 总页数

@property (nonatomic, assign) int currentIndex;// 当前显示的索引

// 获取索引对应的view
- (UIView *)actualViewWithIndex:(int)index;

@end
