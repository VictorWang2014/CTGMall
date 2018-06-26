//
//  UIViewController+CTGHook.m
//  CTGMall
//
//  Created by admin on 2018/6/18.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "UIViewController+CTGHook.h"
#import "CTGLoginViewController.h"
#import "CTGAddressMagerViewController.h"
#import "PersonalCenterViewController.h"
#import <objc/runtime.h>

@implementation UIViewController (CTGHook)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method fromMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
        Method toMethod = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
        
        if (!class_addMethod([self class], @selector(swizzlingViewDidLoad), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
            method_exchangeImplementations(fromMethod, toMethod);
        }
    });
}

- (void)swizzlingViewDidLoad {
    if ([self isKindOfClass:PersonalCenterViewController.class]) {
        [self.navigationController pushViewController:[CTGAddressMagerViewController new] animated:YES];
    }
    [self swizzlingViewDidLoad];
}

@end



@implementation UINavigationController (CTGHook)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method fromMethod = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
        Method toMethod = class_getInstanceMethod([self class], @selector(ctgPushViewController:animated:));
        if (!class_addMethod([self class], @selector(ctgPushViewController:animated:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
            method_exchangeImplementations(fromMethod, toMethod);
        }
    });
}

@end
