//
//  UIViewController+VCCategory.m
//  CTGMall
//
//  Created by wangmingquan on 2018/5/30.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "UIViewController+VCCategory.h"
#import <objc/runtime.h>

@implementation UIViewController (VCCategory)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method viewWillAppear_originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method viewWillAppear_swizzledMethod = class_getInstanceMethod(self, @selector(vc_viewWillAppear:));
        method_exchangeImplementations(viewWillAppear_originalMethod, viewWillAppear_swizzledMethod);
        
        Method viewWillDisappear_originalMethod = class_getInstanceMethod(self, @selector(viewWillDisappear:));
        Method viewWillDisappear_swizzledMethod = class_getInstanceMethod(self, @selector(vc_viewWillDisappear:));
        method_exchangeImplementations(viewWillDisappear_originalMethod, viewWillDisappear_swizzledMethod);
    });
}

- (void)vc_viewWillAppear:(BOOL)animated {
    [self vc_viewWillAppear:animated];
    if (self.vcNavigationBarHidden && self.navigationController.navigationBarHidden == NO) {
        [self.navigationController setNavigationBarHidden:self.vcNavigationBarHidden animated:YES];
    } else if (!self.vcNavigationBarHidden && self.navigationController.navigationBarHidden == YES) {
        [self.navigationController setNavigationBarHidden:self.vcNavigationBarHidden animated:YES];
    }
    if (self.vcNavigationBarColor) {
        [self.navigationController.navigationBar setBarTintColor:self.vcNavigationBarColor];
    } else {
        [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    }
}

- (void)vc_viewWillDisappear:(BOOL)animated {
    [self vc_viewWillDisappear:animated];
    
}

- (void)setVcNavigationBarColor:(UIColor *)vcNavigationBarColor {
    objc_setAssociatedObject(self, @selector(vcNavigationBarColor), vcNavigationBarColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)vcNavigationBarColor {
    return objc_getAssociatedObject(self, @selector(vcNavigationBarColor));
}

- (void)setVcNavigationBarHidden:(BOOL)vcNavigationBarHidden {
    objc_setAssociatedObject(self, @selector(vcNavigationBarHidden), [NSNumber numberWithBool:vcNavigationBarHidden], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)vcNavigationBarHidden {
    NSNumber *number = objc_getAssociatedObject(self, @selector(vcNavigationBarHidden));
    if (number) {
        return [number boolValue];
    }
    return NO;
}

@end
