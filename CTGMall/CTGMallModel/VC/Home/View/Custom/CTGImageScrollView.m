//
//  CTGImageScrollView.m
//  CTGMall
//
//  Created by admin on 2018/5/10.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGImageScrollView.h"
#import "VCLoopScrollView.h"
#import "VCHeaders.h"

@interface CTGImageScrollView () <VCLoopScrollDelegate> {
    VCLoopScrollView *_scrollView;
    UIPageControl *_pageControl;
}


@end

@implementation CTGImageScrollView

- (void)dealloc {
    [_scrollView releaseTimer];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.superview) {
        [self initialView];
    }
}

- (void)initialView {
    _scrollView = [[VCLoopScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate = self;
    _scrollView.totalCount = (int)self.listArray.count;
    [self addSubview:_scrollView];
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.vcheight-40, self.vcwidth, 40)];
    _pageControl.numberOfPages = (int)self.listArray.count;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    [self addSubview:_pageControl];
}

#pragma mark - public
- (void)setListArray:(NSMutableArray *)listArray {
    if (listArray != _listArray) {
        _listArray = listArray;
        _scrollView.totalCount = (int)self.listArray.count;
        _pageControl.numberOfPages = (int)self.listArray.count;
        [self reloadData];
    }
}

- (void)reloadData {
    [_scrollView reloadData];
}

#pragma mark - VCLoopScrollDelegate
- (UIView *)pageViewInitialWithFrame:(CGRect)frame atIndex:(int)index {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    NSString *string = [self.listArray objectAtIndex:index];
    [imageView sd_setImageWithURL:[NSURL URLWithString:string]];
    return imageView;
}

- (void)pageView:(UIView *)pageView fillDataAtIndex:(int)index {
    UIImageView *imageView = (UIImageView *)pageView;
    NSString *string = [self.listArray objectAtIndex:index];
    [imageView sd_setImageWithURL:[NSURL URLWithString:string]];
}

- (void)pageView:(UIView *)pageView didShowAtIndex:(int)index {
    _pageControl.currentPage = index;
}

@end
