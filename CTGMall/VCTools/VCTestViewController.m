//
//  VCTestViewController.m
//  CTGMall
//
//  Created by admin on 2018/5/9.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "VCTestViewController.h"
#import "CTGImageScrollView.h"
#import "NSObject+Category.h"
#import "CTGMyOrderPageView.h"

@interface VCTestViewController () {
    CTGImageScrollView *_scrll;
}

@end

@implementation VCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array = @[@"http://mall.pad001.com/data/afficheimg/20161114nraqzu.jpg",
                       @"http://mall.pad001.com/data/afficheimg/20161114prfywc.jpg",
                       @"http://mall.pad001.com/data/afficheimg/20161114uxmgov.png",
                       @"http://mall.pad001.com/data/afficheimg/20161114ypdlyr.jpg"
                       ];
//    _scrll = [[CTGImageScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.vcwidth, 200)];
//    _scrll.listArray = [NSMutableArray arrayWithArray:array];
//    [self.view addSubview:_scrll];
    CTGMyOrderPageView *view = [[CTGMyOrderPageView alloc] initWithFrame:CGRectMake(0, 0, self.view.vcwidth, self.view.vcheight)];
    [self.view addSubview:view];
}

@end
