//
//  VCAppMonitor.h
//  CTGMall
//
//  Created by wangmingquan on 2018/7/5.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCAppMonitor : NSObject

+ (instancetype)shareMonitor;

- (void)start;

@end
