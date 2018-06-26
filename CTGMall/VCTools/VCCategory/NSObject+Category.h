//
//  NSObject+Category.h
//  test
//
//  Created by wangmingquan on 2018/3/21.
//  Copyright © 2018年 wangmingquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Category)

@end

@interface UIColor (VCExtend)

+ (UIColor *)randomColor;

@end

@interface UICollectionViewCell (VCExtend)

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@interface UIView (frame)

@property (nonatomic, assign) float vcoriginX;
@property (nonatomic, assign) float vcoriginY;
@property (nonatomic, assign) float vcheight;
@property (nonatomic, assign) float vcwidth;
@property (nonatomic, readonly) float vcmaxX;
@property (nonatomic, readonly) float vcmaxY;

@end
