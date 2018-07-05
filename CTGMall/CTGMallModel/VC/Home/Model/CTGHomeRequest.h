//
//  CTGHomeRequest.h
//  CTGMall
//
//  Created by admin on 2018/6/27.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceDefine.h"

@interface CTGHomeRequest : NSObject

- (void)requestHomeBannerSuccess:(CTGDataCallBack)success failure:(CTGDataCallBack)failure;

@end
