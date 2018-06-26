//
//  VCSegmentView.h
//  CTGMall
//
//  Created by wangmingquan on 2018/6/4.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VCSegmentViewDelegate <NSObject>

- (void)segmentSelectAtIndex:(int)index;

@end

@interface VCSegmentView : UIView

@property (nonatomic, assign) id<VCSegmentViewDelegate> delegate;
@property (nonatomic, assign) BOOL scrollEnable;// 是否可以滚动，可以滚动，则
@property (nonatomic, assign) int selectIndex;
@property (nonatomic, assign) int originalSelectIndex;
@property (nonatomic, strong) NSArray *segments;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectColor;

@end
