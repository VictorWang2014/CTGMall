//
//  VCAppMonitor.m
//  CTGMall
//
//  Created by wangmingquan on 2018/7/5.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "VCAppMonitor.h"
#import <objc/runtime.h>

@interface VCAppMonitor () {
    CFRunLoopObserverRef _observer;
    CFRunLoopTimerRef _timer;
}

@property (nonatomic, retain) NSThread *thread;
@property (nonatomic, assign) BOOL excuting;
@property (nonatomic, retain) NSDate *startDate;

@end

@implementation VCAppMonitor

+ (instancetype)shareMonitor {
    static VCAppMonitor *monitor;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        monitor = [[VCAppMonitor alloc] init];
        monitor.thread = [[NSThread alloc] initWithTarget:self selector:@selector(monitorThreadEntryPoint) object:nil];
        [monitor.thread start];
    });
    return monitor;
}

+ (void)monitorThreadEntryPoint {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"FluencyMonitor"];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}

- (void)handleStackInfo {
        //    NSArray *ar = [NSThread callStackSymbols];
        //    CMLogInfo(@"%@", ar);
}

- (void)start {
    if (_observer) {
        return;
    }
    CFRunLoopObserverContext context = {0,(__bridge void*)self, NULL, NULL, NULL};
    _observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &runLoopObserverCallBack, &context);
    CFRunLoopAddObserver(CFRunLoopGetMain(), _observer, kCFRunLoopCommonModes);
    [self performSelector:@selector(addTimerToMonitorThread) onThread:self.thread withObject:nil waitUntilDone:NO modes:@[NSRunLoopCommonModes]];
}

- (void)addTimerToMonitorThread
{
    if (_timer) {
        return;
    }
        // 创建一个timer
    CFRunLoopRef currentRunLoop = CFRunLoopGetCurrent();
    CFRunLoopTimerContext context = {0, (__bridge void*)self, NULL, NULL, NULL};
    _timer = CFRunLoopTimerCreate(kCFAllocatorDefault, 0.1, 0.01, 0, 0,
                                  &runLoopTimerCallBack, &context);
        // 添加到子线程的RunLoop中
    CFRunLoopAddTimer(currentRunLoop, _timer, kCFRunLoopCommonModes);
}


static void runLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
        //    AppMonitor *monitor = (__bridge AppMonitor*)info;
        //    NSLog(@"MainRunLoop---%@",[NSThread currentThread]);
        //    switch (activity) {
        //        case kCFRunLoopEntry:
        //            NSLog(@"kCFRunLoopEntry");
        //            break;
        //        case kCFRunLoopBeforeTimers:
        //            NSLog(@"kCFRunLoopBeforeTimers");
        //            break;
        //        case kCFRunLoopBeforeSources:
        //            NSLog(@"kCFRunLoopBeforeSources");
        //            monitor.startDate = [NSDate date];
        //            monitor.excuting = YES;
        //            break;
        //        case kCFRunLoopBeforeWaiting:
        //            NSLog(@"kCFRunLoopBeforeWaiting");
        //            monitor.excuting = NO;
        //            break;
        //        case kCFRunLoopAfterWaiting:
        //            NSLog(@"kCFRunLoopAfterWaiting");
        //            break;
        //        case kCFRunLoopExit:
        //            NSLog(@"kCFRunLoopExit");
        //            break;
        //        default:
        //            break;
        //    }
}

static void runLoopTimerCallBack(CFRunLoopTimerRef timer, void *info)
{
        //    AppMonitor *monitor = (__bridge AppMonitor*)info;
        //    if (!monitor.excuting) {
        //        return;
        //    }
        //
        //        // 如果主线程正在执行任务，并且这一次loop 执行到 现在还没执行完，那就需要计算时间差
        //    NSTimeInterval excuteTime = [[NSDate date] timeIntervalSinceDate:monitor.startDate];
        //    NSLog(@"定时器---%@",[NSThread currentThread]);
        //    NSLog(@"主线程执行了---%f秒",excuteTime);
        //
        //    if (excuteTime >= 0.01) {
        //        NSLog(@"线程卡顿了%f秒",excuteTime);
        //        [monitor handleStackInfo];
        //    }
}

@end
