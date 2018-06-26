//
//  CTGPersonalOrderSetTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/6/3.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGPersonalOrderSetTableViewCell.h"
#import "VCHeaders.h"

@interface CTGPersonalOrderSetTableViewCell ()

@property (nonatomic, strong) NSMutableArray *viewArray;

@end


@implementation CTGPersonalOrderSetTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialView];
    }
    return self;
}

- (void)layoutSubviews {
    __block float originX = 0;
    float width = self.frame.size.width/4;
    [self.viewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *view = obj;
        view.vcoriginX = originX;
        view.vcwidth = width;
        originX += width;
    }];
}

- (void)initialView {
    [self.viewArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    float originX = 0;
    float width = self.frame.size.width/4;
    self.viewArray = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originX, 0, width, 95)];
        [self.contentView addSubview:view];
        [self.viewArray addObject:view];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 23, view.vcwidth, 20);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        [view addSubview:imageView];
        imageView.backgroundColor = [UIColor redColor];
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(1, 50, view.vcwidth-2, 20);
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor blackColor];
        [view addSubview:label];
        originX += width;
    }
}

@end
