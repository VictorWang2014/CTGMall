//
//  VCSegmentView.m
//  CTGMall
//
//  Created by wangmingquan on 2018/6/4.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "VCSegmentView.h"
#import "VCHeaders.h"

@interface VCSegmentView () <UIScrollViewDelegate> {
    int _lastSelectIndex;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *viewsArray;

@end


@implementation VCSegmentView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.originalSelectIndex = -1;
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (self.superview) {
        [self initialView];
    }
}

#pragma mark - setter
- (void)setSelectIndex:(int)selectIndex {
    if (_selectIndex != selectIndex) {
        _lastSelectIndex = _selectIndex;
        _selectIndex = selectIndex;
        UIButton *lastSelectButton = [self.viewsArray objectAtIndex:_lastSelectIndex];
        UIButton *selectButton = [self.viewsArray objectAtIndex:_selectIndex];
        lastSelectButton.selected = NO;
        selectButton.selected = YES;
        [self segmentItemScrollToVisible];
        if ([self.delegate respondsToSelector:@selector(segmentSelectAtIndex:)]) {
            [self.delegate segmentSelectAtIndex:selectIndex];
        }
    }
}

#pragma mark - buttonActions
- (void)buttonClick:(UIButton *)button {
    int selectIndex = (int)button.tag;
    if (self.selectIndex != selectIndex) {
        self.selectIndex = selectIndex;
    }
}

- (void)segmentItemScrollToVisible {
    UIButton *selectButton = [self.viewsArray objectAtIndex:self.selectIndex];
    if (selectButton.vcoriginX < self.scrollView.contentOffset.x) {
        [self.scrollView setContentOffset:CGPointMake(selectButton.vcoriginX, 0) animated:YES];
    } else if (selectButton.vcoriginX+selectButton.vcwidth > self.scrollView.contentOffset.x+self.scrollView.vcwidth) {
        [self.scrollView setContentOffset:CGPointMake(selectButton.vcoriginX+selectButton.vcwidth-self.scrollView.vcwidth, 0) animated:YES];
    }
}

#pragma mark - private
- (void)initialView {
    self.font = self.font == nil ? [UIFont systemFontOfSize:13] : self.font;
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.selectIndex = self.originalSelectIndex == -1 ? 0 : self.originalSelectIndex;
    _lastSelectIndex = self.selectIndex;
    self.viewsArray = [NSMutableArray array];
    float originx = 0;
    float itemWidth = 0;
    if (!self.scrollEnable) {
        itemWidth = self.frame.size.width/self.segments.count;
    }
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.scrollEnabled = YES;
    [self addSubview:self.scrollView];
    
    for (int i = 0; i < self.segments.count; i++) {
        NSDictionary *dic = [self.segments objectAtIndex:i];
        NSString *title = [dic objectForKey:@"title"];
        CGRect frame;
        if (!self.scrollEnable) {
            frame = CGRectMake(originx, 0, itemWidth, self.scrollView.vcheight);
        } else {
            CGRect rect = [title boundingRectWithSize:CGSizeMake(300, 25) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
            frame = CGRectMake(originx, 0, rect.size.width+40, self.scrollView.vcheight);
        }
        UIButton *button = [self segmentItemViewWithData:dic index:i];
        button.frame = frame;
        [self.scrollView addSubview:button];
        [self.viewsArray addObject:button];
        if (self.selectIndex == i) {
            button.selected = YES;
        }
        originx += button.vcwidth;
    }
    if (self.scrollEnable) {
        self.scrollView.contentSize = CGSizeMake(originx, 0);
    }
}

- (UIButton *)segmentItemViewWithData:(NSDictionary *)dic index:(int)index {
    NSString *title = [dic objectForKey:@"title"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = self.font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:self.normalColor forState:UIControlStateNormal];
    [button setTitleColor:self.selectColor forState:UIControlStateSelected];
    [button setTitleColor:self.selectColor forState:UIControlStateHighlighted];
    button.tag = index;
    return button;
}

@end
