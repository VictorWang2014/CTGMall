//
//  CTGHomeRequest.m
//  CTGMall
//
//  Created by admin on 2018/6/27.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGHomeRequest.h"

@implementation CTGHomeRequest

- (void)requestHomeBannerSuccess:(CTGDataCallBack)success failure:(CTGDataCallBack)failure {
    NSURL *url = [NSURL URLWithString:kHomeTitleBannerUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        if (!error) {
            if (success) {
                success(jsonObj);
            }
        } else {
            if (failure) {
                failure(error.description);
            }
        }
    }];
    [task resume];
}

@end
