//
//  VCLoopScrollView.m
//  TempTestLib
//
//  Created by wangmingquan on 2018/5/5.
//  Copyright © 2018年 wangmingquan. All rights reserved.
//

#import "VCLoopScrollView.h"
#define kOffsetRatio .9

@interface VCLinkNode : NSObject {
    @package
    __unsafe_unretained VCLinkNode *_prev;
    __unsafe_unretained VCLinkNode *_next;
    id value;
}

@end

@implementation VCLinkNode @end


@interface VCLoopScrollView () <UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    NSTimer *_timer;
    
    VCLinkNode *_head;
    float _oldOffset;
    float _Offset;
    VCLoopScrollMoveType _moveType;
    BOOL _needFire;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *viewsArray;
@property (nonatomic, strong) NSMutableArray *showViewArray;

@end

@implementation VCLoopScrollView

- (void)dealloc {
    [self endTimer];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
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
    self.viewsArray = [NSMutableArray array];
    self.showViewArray = [NSMutableArray array];
    self.currentIndex = 0;
    _moveType = VCLoopScrollMoveTypeNone;
    _needFire = NO;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self startTimer];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake(3*CGRectGetWidth(_scrollView.frame), 0);
    float x = 0;
    for (int i = 0; i < 3; i++) {
        CGRect rect = CGRectMake(self.scrollDirection==VCLoopScrollDirectionHorizon?x:0, self.scrollDirection==VCLoopScrollDirectionHorizon?0:x, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        UIView *view = [self.delegate pageViewInitialWithFrame:rect atIndex:[self validIndex:(self.currentIndex+i-1)]];
        [_scrollView addSubview:view];
        x += self.scrollDirection==VCLoopScrollDirectionHorizon?CGRectGetWidth(self.frame):CGRectGetHeight(self.frame);
        [self.viewsArray addObject:view];
    }
    self.showViewArray =  [NSMutableArray arrayWithArray:self.viewsArray];
    _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame), 0);
    _scrollView.delegate = self;
}

- (int)validIndex:(int)index {
    if (index >= self.totalCount) {
        index = 0;
    } else if (index < 0) {
        index = self.totalCount-1;
    }
    return index;
}

- (void)reRankScrollSubviews {
    if (_moveType == VCLoopScrollMoveTypeLeft) {
        NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.showViewArray];
        id value = [tmpArray objectAtIndex:0];
        [tmpArray removeObjectAtIndex:0];
        [tmpArray addObject:value];
        self.showViewArray = [NSMutableArray arrayWithArray:tmpArray];
    } else if (_moveType == VCLoopScrollMoveTypeRight) {
        NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.showViewArray];
        id value = [tmpArray lastObject];
        [tmpArray removeObjectAtIndex:tmpArray.count-1];
        [tmpArray insertObject:value atIndex:0];
        self.showViewArray = [NSMutableArray arrayWithArray:tmpArray];
    }
    float x = 0;
    for (int i = 0; i < self.showViewArray.count; i++) {
        UIView *view = [self.showViewArray objectAtIndex:i];
        CGRect frame = view.frame;
        if (self.scrollDirection == VCLoopScrollDirectionHorizon) {
            frame.origin.x = x;
            x += CGRectGetWidth(_scrollView.frame);
        } else {
            frame.origin.y = x;
            x += CGRectGetHeight(_scrollView.frame);
        }
        view.frame = frame;
        [self.delegate pageView:view fillDataAtIndex:[self validIndex:self.currentIndex-1+i]];
    }
}

- (void)startTimer {
    if (!_timer) {
        __weak typeof(self) weakSelf = self;
        _timer = [NSTimer timerWithTimeInterval:3. repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakSelf.scrollView setContentOffset:CGPointMake(CGRectGetWidth(weakSelf.scrollView.frame)*2, 0) animated:YES];
        }];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    } else {
        [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:_timer.timeInterval]];
    }
}

- (void)suspendTimer {
    if (_timer) {
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

- (void)endTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark - public
- (UIView *)actualViewWithIndex:(int)index {
    int idx = index%3;
    if (self.showViewArray.count > idx) {
        return [self.showViewArray objectAtIndex:idx];
    }
    return nil;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _needFire = NO;
    if (self.scrollDirection == VCLoopScrollDirectionHorizon) {
        _oldOffset = scrollView.contentOffset.x;
    } else {
        _oldOffset = scrollView.contentOffset.y;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (_needFire && [self.delegate respondsToSelector:@selector(pageView:didShowAtIndex:)]) {
            NSLog(@"fire index %d", self.currentIndex);
            [self.delegate pageView:[self actualViewWithIndex:_currentIndex] didShowAtIndex:_currentIndex];
        }
        _needFire = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_needFire && [self.delegate respondsToSelector:@selector(pageView:didShowAtIndex:)]) {
        NSLog(@"fire index %d", self.currentIndex);
        [self.delegate pageView:[self actualViewWithIndex:_currentIndex] didShowAtIndex:_currentIndex];
    }
    _needFire = NO;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (_needFire && [self.delegate respondsToSelector:@selector(pageView:didShowAtIndex:)]) {
        NSLog(@"fire index %d", self.currentIndex);
        [self.delegate pageView:[self actualViewWithIndex:_currentIndex] didShowAtIndex:_currentIndex];
    }
    _needFire = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollDirection == VCLoopScrollDirectionHorizon) {
        float offset = scrollView.contentOffset.x;
        float width = CGRectGetWidth(scrollView.frame);
        float pageOffset = offset/width;
        if (offset > _oldOffset) {// 往左滑
            if (pageOffset > (kOffsetRatio+1)) {// 可以重置
                _needFire = YES;
                self.currentIndex = [self validIndex:self.currentIndex+1];
                _scrollView.delegate = nil;
                _scrollView.contentOffset = CGPointMake(_scrollView.contentOffset.x-CGRectGetWidth(_scrollView.frame), 0);
                _scrollView.delegate = self;
                _moveType = VCLoopScrollMoveTypeLeft;
                [self reRankScrollSubviews];
            }
        } else if (offset < _oldOffset) {// 往右滑
            if (pageOffset < (1-kOffsetRatio)) {// 可以重置
                _needFire = YES;
                self.currentIndex = [self validIndex:self.currentIndex-1];
                _scrollView.delegate = nil;
                _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame)+_scrollView.contentOffset.x, 0);
                _scrollView.delegate = self;
                _moveType = VCLoopScrollMoveTypeRight;
                [self reRankScrollSubviews];
            }
        }
    } else {
        float offset = scrollView.contentOffset.y;
        float height = CGRectGetHeight(scrollView.frame);
        float pageOffset = offset/height;
        if (offset > _oldOffset) {// 往左滑
            if (pageOffset > (kOffsetRatio+1)) {// 可以重置
                _needFire = YES;
                self.currentIndex = [self validIndex:self.currentIndex+1];
                _scrollView.delegate = nil;
                _scrollView.contentOffset = CGPointMake(0, _scrollView.contentOffset.y-CGRectGetHeight(_scrollView.frame));
                _scrollView.delegate = self;
                _moveType = VCLoopScrollMoveTypeLeft;
                [self reRankScrollSubviews];
            }
        } else if (offset < _oldOffset) {// 往右滑
            if (pageOffset < (1-kOffsetRatio)) {// 可以重置
                _needFire = YES;
                self.currentIndex = [self validIndex:self.currentIndex-1];
                _scrollView.delegate = nil;
                _scrollView.contentOffset = CGPointMake(0, CGRectGetHeight(_scrollView.frame)+_scrollView.contentOffset.y);
                _scrollView.delegate = self;
                _moveType = VCLoopScrollMoveTypeRight;
                [self reRankScrollSubviews];
            }
        }
    }
}

#pragma mark - NSNotification
- (void)appBecomeActive:(NSNotification *)notification {
    [self startTimer];
}

- (void)appEnterBackground:(NSNotification *)notification {
    [self suspendTimer];
}

@end


