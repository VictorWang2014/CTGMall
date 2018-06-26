//
//  CTGNoticeScrollView.m
//  CTGMall
//
//  Created by admin on 2018/5/11.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGNoticeScrollView.h"
#import "VCLoopScrollView.h"
#import "VCHeaders.h"

@interface CTGNoticeScrollView () <VCLoopScrollDelegate> {
    VCLoopScrollView *_scrollView;
}

@end

@implementation CTGNoticeScrollView

- (void)dealloc {
    [_scrollView releaseTimer];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialView];
    }
    return self;
}

- (void)initialView {
    _scrollView = [[VCLoopScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate = self;
    _scrollView.scrollDirection = VCLoopScrollDirectionVertical;
    _scrollView.totalCount = (int)self.listArray.count;
    [self addSubview:_scrollView];
}

#pragma mark - public
- (void)setListArray:(NSMutableArray *)listArray {
    if (listArray != _listArray) {
        _listArray = listArray;
        _scrollView.totalCount = (int)self.listArray.count;
        [self reloadData];
    }
}

- (void)reloadData {
    [_scrollView reloadData];
}

#pragma mark - VCLoopScrollDelegate
- (UIView *)pageViewInitialWithFrame:(CGRect)frame atIndex:(int)index {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
    imageView.tag = 111;
    [view addSubview:imageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.vcmaxX+10, 0, view.vcwidth-imageView.vcmaxX-10, frame.size.height)];
    label.text = [NSString stringWithFormat:@"欢迎光临。。。%d", index];
    label.tag = 112;
    label.textColor = [UIColor darkGrayColor];
    [view addSubview:label];
    return view;
}

- (void)pageView:(UIView *)pageView fillDataAtIndex:(int)index {
    UIImageView *imageView = (UIImageView *)[pageView viewWithTag:111];
    imageView.image = [UIImage imageNamed:@"tabbar_home"];
//    NSString *string = [self.listArray objectAtIndex:index];
//    [imageView sd_setImageWithURL:[NSURL URLWithString:string]];
    UILabel *label = (UILabel *)[pageView viewWithTag:112];
    label.text = [NSString stringWithFormat:@"欢迎光临。。。%d", index];
}

- (void)pageView:(UIView *)pageView didShowAtIndex:(int)index {
    
}

@end
