//
//  CTGMyOrderPageView.m
//  CTGMall
//
//  Created by admin on 2018/5/17.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGMyOrderPageView.h"
#import "VCHeaders.h"
#import "CTGOrderTableView.h"
#import "CTGMyOrderModel.h"

@interface CTGMyOrderPageView () <VCHeadScrollViewDelegate, VCSegmentViewDelegate>

@property (nonatomic, strong) VCHeadScrollView *scrollView;// 滚动view
@property (nonatomic, strong) VCSegmentView *segmentView;// 头部滚动view
@property (nonatomic, strong) CTGMyOrderModel *model;// 数据源

@end

@implementation CTGMyOrderPageView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.model = [[CTGMyOrderModel alloc] init];
        
        self.segmentView = [[VCSegmentView alloc] initWithFrame:CGRectMake(0, 0, self.vcwidth, 45)];
        self.segmentView.backgroundColor = [UIColor whiteColor];
        self.segmentView.delegate = self;
        self.segmentView.segments = @[@{@"title":@"全部"}, @{@"title":@"待付款"}, @{@"title":@"待发货"}, @{@"title":@"待收货"}, @{@"title":@"待评价"}];
        self.segmentView.normalColor = [UIColor blackColor];
        self.segmentView.selectColor = [UIColor blueColor];
        
        self.scrollView = [[VCHeadScrollView alloc] initWithFrame:CGRectMake(0, 0, self.vcwidth, self.vcheight)];
        self.scrollView.delegate = self;
        self.scrollView.hsCellReuseType = HSCellIdentifierTypeSame;
        [self addSubview:self.scrollView];
    }
    return self;
}

#pragma mark - VCHeadScrollViewDelegate
- (UIScrollView *)cellOfHeadScrollViewAtIndex:(int)index {
    CGRect frame = self.bounds;
    frame.origin.x = self.segmentView.vcheight;
    frame.size.height = frame.size.height-self.segmentView.vcheight;
    CTGOrderTableView *tableView = [[CTGOrderTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.listArray = [self.model.dataDic objectForKey:@(index)];
    return tableView;
}

- (int)numberOfSubHeadScrollView {
    return 5;
}

- (void)scrollViewReloadData:(UIScrollView *)scrollView atIndex:(int)index {
    if ([scrollView isKindOfClass:[CTGOrderTableView class]]) {
        CTGOrderTableView *tableView = (CTGOrderTableView *)scrollView;
        tableView.listArray = [self.model.dataDic objectForKey:@(index)];
        [tableView reloadData];
    }
    NSLog(@"%d", index);
}

- (UIView *)vcHeaderView {
    return nil;
}

- (UIView *)vcSegmentView {
    return self.segmentView;
}

- (void)subScrollView:(UIScrollView *)scrollView didShowAtIndex:(int)index {
    self.segmentView.selectIndex = index;
    NSLog(@"%d", index);
}

#pragma mark - VCSegmentViewDelegate
- (void)segmentSelectAtIndex:(int)index {
    [_scrollView scrollToPageIndex:index animation:YES];
    // request data
}


@end
