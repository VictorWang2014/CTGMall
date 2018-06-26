//
//  VCTabbarViewController.m
//  CTGMall
//
//  Created by admin on 2018/5/7.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "VCTabbarViewController.h"
#import "ShopGroupViewController.h"
#import "PersonalCenterViewController.h"
#import "ShopCartViewController.h"
#import "HomeViewController.h"
#import "SourceDefine.h"

@interface VCTabbarViewController ()

@end


@implementation VCTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    UINavigationController *homeNavigationController = [self homeNavigationController];
    UINavigationController *shopGroupNavigationController = [self shopGroupNavigationController];
    UINavigationController *shopCartNavigationController = [self shopCartNavigationController];
    UINavigationController *personalCenterNavigationController = [self personalCenterNavigationController];
    self.viewControllers = @[homeNavigationController, shopGroupNavigationController, shopCartNavigationController, personalCenterNavigationController];
    self.tabBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - private
- (UINavigationController *)homeNavigationController {
    HomeViewController *vc = [[HomeViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage tabbarItemHome] selectedImage:nil];
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    return navigationController;
}

- (UINavigationController *)shopGroupNavigationController {
    ShopGroupViewController *vc = [[ShopGroupViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"分类" image:[UIImage tabbarItemShopGroup] selectedImage:nil];
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 4, 4, 4);
    return navigationController;
}

- (UINavigationController *)shopCartNavigationController {
    ShopCartViewController *vc = [[ShopCartViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:[UIImage tabbarItemShopCart] selectedImage:nil];
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    return navigationController;
}

- (UINavigationController *)personalCenterNavigationController {
    PersonalCenterViewController *vc = [[PersonalCenterViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage tabbarItemPersonalCenter] selectedImage:nil];
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    return navigationController;
}

@end
