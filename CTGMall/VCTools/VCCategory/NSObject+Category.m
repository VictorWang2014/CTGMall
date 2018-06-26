//
//  NSObject+Category.m
//  test
//
//  Created by wangmingquan on 2018/3/21.
//  Copyright © 2018年 wangmingquan. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSObject (Category)

@end


@implementation UIColor (VCExtend)

+ (UIColor *)randomColor {
    return [UIColor colorWithRed:(arc4random_uniform(256))/255.0f green:(arc4random_uniform(256))/255.0f blue:(arc4random_uniform(256))/255.0f alpha:1];
}

@end

@implementation UICollectionViewCell (VCExtend)

- (void)setIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, @selector(setIndexPath:), indexPath, OBJC_ASSOCIATION_RETAIN);
}

- (NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, @selector(setIndexPath:));
}

@end

@implementation UIView (frame)

- (void)setVcoriginX:(float)vcoriginX {
    CGRect frame = self.frame;
    frame.origin.x = vcoriginX;
    self.frame = frame;
}

- (float)vcoriginX {
    return self.frame.origin.x;
}

- (void)setVcoriginY:(float)vcoriginY {
    CGRect frame = self.frame;
    frame.origin.y = vcoriginY;
    self.frame = frame;
}

- (float)vcoriginY {
    return self.frame.origin.y;
}

- (void)setVcwidth:(float)vcwidth {
    CGRect frame = self.frame;
    frame.size.width = vcwidth;
    self.frame = frame;
}

- (float)vcwidth {
    return self.frame.size.width;
}

- (void)setVcheight:(float)vcheight {
    CGRect frame = self.frame;
    frame.size.height = vcheight;
    self.frame = frame;
}

- (float)vcheight {
    return self.frame.size.height;
}

- (float)vcmaxX {
    return CGRectGetMaxX(self.frame);
}

- (float)vcmaxY {
    return CGRectGetMaxY(self.frame);
}

@end

