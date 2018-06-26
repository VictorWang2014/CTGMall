//
//  CTGMyOrderViewController.m
//  CTGMall
//
//  Created by admin on 2018/5/17.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGMyOrderViewController.h"
#import "CTGMyOrderPageView.h"

@interface CTGMyOrderViewController ()

@property (nonatomic, strong) CTGMyOrderPageView *pageView;

@end

@implementation CTGMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
    self.pageView = [[CTGMyOrderPageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.pageView];
}


@end
