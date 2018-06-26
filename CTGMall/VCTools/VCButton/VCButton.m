//
//  VCButton.m
//  CTGMall
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "VCButton.h"

@implementation VCButton


- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.vctitleRect)) {
        return self.vctitleRect;
    }
    return contentRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.vcimageRect)) {
        return self.vcimageRect;
    }
    return contentRect;
}

@end
