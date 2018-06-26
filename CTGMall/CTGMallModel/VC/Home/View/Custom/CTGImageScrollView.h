//
//  CTGImageScrollView.h
//  CTGMall
//
//  Created by admin on 2018/5/10.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTGImageScrollView;

@protocol CTGImageScrollDelegate <NSObject>
// 点击索引
- (void)scrollView:(CTGImageScrollView *)scrollView didSelectAtIndex:(int)index;

@end

// 图片轮转图
@interface CTGImageScrollView : UIView

@property (nonatomic, strong) NSMutableArray *listArray;// 填充数据

// 数据刷新
- (void)reloadData;

@end
