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
    VCLinkNode *_prev;
    VCLinkNode *_next;
    id value;
}

@end

@implementation VCLinkNode @end


@interface VCLoopScrollView () <UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    NSTimer *_timer;
    
    VCLinkNode *_head;
    VCLinkNode *_tail;
    float _oldOffset;
    float _Offset;
    VCLoopScrollMoveType _moveType;
    BOOL _needFire;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *viewsArray;

@end

@implementation VCLoopScrollView

- (void)dealloc {
    _tail = nil;
    _head = nil;
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
    if (self.totalCount == 0) {
        return;
    }
    self.viewsArray = [NSMutableArray array];
    self.currentIndex = 0;
    _moveType = VCLoopScrollMoveTypeNone;
    _needFire = NO;
    _head = nil;
    _tail = nil;
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
        [self insertLinkNode:view];
    }
    if (self.scrollDirection==VCLoopScrollDirectionHorizon) {
        _scrollView.contentOffset = CGPointMake(CGRectGetWidth(_scrollView.frame), 0);
    } else {
        _scrollView.contentOffset = CGPointMake(0, CGRectGetHeight(_scrollView.frame));
    }
    _scrollView.delegate = self;
}

- (void)insertLinkNode:(id)value {
    if (_head) {
        VCLinkNode *_node = [VCLinkNode new];
        _tail->_next = _node;
        _node->_prev = _tail;
        _node->value = value;
        _tail = _node;
    } else {
        _head = [VCLinkNode new];
        _head->value = value;
        _tail = _head;
    }
}

- (void)bringTailNodeToHead {
    _tail->_next = _head;
    _head->_prev = _tail;
    
    _head = _tail;
    _tail = _tail->_prev;
    
    _tail->_next = nil;
    _head->_prev = nil;
}

- (void)bringHeadNodeToTail {
    _tail->_next = _head;
    _head->_prev = _tail;
    
    _tail = _head;
    _head = _head->_next;
    
    _head->_prev = nil;
    _tail->_next = nil;
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
        [self bringHeadNodeToTail];
    } else if (_moveType == VCLoopScrollMoveTypeRight) {
        [self bringTailNodeToHead];
    }
    [self rankSubviewsOnFire:YES];
}

- (void)rankSubviewsOnFire:(BOOL)fire {
    VCLinkNode *tmpNode = _head; int i = 0; float x = 0;
    for (; tmpNode; tmpNode = tmpNode->_next) {
        UIView *view = (UIView *)tmpNode->value;
        CGRect frame = view.frame;
        if (self.scrollDirection == VCLoopScrollDirectionHorizon) {
            frame.origin.x = x;
            x += CGRectGetWidth(_scrollView.frame);
        } else {
            frame.origin.y = x;
            x += CGRectGetHeight(_scrollView.frame);
        }
        view.frame = frame;
        if (fire) {
            [self.delegate pageView:view fillDataAtIndex:[self validIndex:self.currentIndex-1+i]];
        }
        i++;
    }
}

- (void)startTimer {
    if (!_timer) {
        __weak typeof(self) weakSelf = self;
        if (@available(iOS 10.0, *)) {
            _timer = [NSTimer timerWithTimeInterval:3. repeats:YES block:^(NSTimer * _Nonnull timer) {
                if (self.scrollDirection==VCLoopScrollDirectionHorizon) {
                    [weakSelf.scrollView setContentOffset:CGPointMake(CGRectGetWidth(weakSelf.scrollView.frame)*2, 0) animated:YES];
                } else {
                    [weakSelf.scrollView setContentOffset:CGPointMake(0, CGRectGetHeight(weakSelf.scrollView.frame)*2) animated:YES];
                }
            }];
        } else {
            // Fallback on earlier versions
        }
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
- (void)releaseTimer {
    [self endTimer];
}

- (UIView *)actualViewWithIndex:(int)index {
    int idx = index%3;
    VCLinkNode *tmpNode = _head;
    for (int i = 0; tmpNode; tmpNode = tmpNode->_next) {
        if (i == idx) {
            return tmpNode->value;
        }
    }
    return nil;
}

- (void)resizeSubviews {
    _scrollView.frame = self.bounds;
    if (self.scrollDirection == VCLoopScrollDirectionHorizon) {
        _scrollView.contentSize = CGSizeMake(self.totalCount*CGRectGetWidth(_scrollView.frame), 0);
    } else {
        _scrollView.contentSize = CGSizeMake(0, self.totalCount*CGRectGetHeight(_scrollView.frame));
    }
    [self rankSubviewsOnFire:YES];
}

- (void)reloadData {
    [self initialView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self suspendTimer];
    _needFire = NO;
    if (self.scrollDirection == VCLoopScrollDirectionHorizon) {
        _oldOffset = scrollView.contentOffset.x;
    } else {
        _oldOffset = scrollView.contentOffset.y;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self startTimer];
        if (_needFire && [self.delegate respondsToSelector:@selector(pageView:didShowAtIndex:)]) {
//            NSLog(@"fire index %d", self.currentIndex);
            [self.delegate pageView:[self actualViewWithIndex:_currentIndex] didShowAtIndex:_currentIndex];
        }
        _needFire = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self startTimer];
    if (_needFire && [self.delegate respondsToSelector:@selector(pageView:didShowAtIndex:)]) {
//        NSLog(@"fire index %d", self.currentIndex);
        [self.delegate pageView:[self actualViewWithIndex:_currentIndex] didShowAtIndex:_currentIndex];
    }
    _needFire = NO;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (_needFire && [self.delegate respondsToSelector:@selector(pageView:didShowAtIndex:)]) {
//        NSLog(@"fire index %d", self.currentIndex);
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


