//
//  CTGNoticeScrollCollectionViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/11.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGNoticeScrollCollectionViewCell.h"
#import "CTGNoticeScrollView.h"
#import "VCHeaders.h"
#import "CTGCommonDefine.h"

@interface CTGNoticeScrollCollectionViewCell ()

@property (nonatomic, strong) CTGNoticeScrollView *scrollView;

@end

@implementation CTGNoticeScrollCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialView];
    }
    return self;
}

- (void)initialView {
    self.scrollView = [[CTGNoticeScrollView alloc] initWithFrame:CGRectMake(0, 0, self.vcwidth, 50)];
    self.scrollView.clipsToBounds = YES;
    [self addSubview:self.scrollView];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.vcwidth, .5)];
    line.backgroundColor = [UIColor lightGrayColor];
    line.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [self addSubview:line];
    line = [[UIView alloc] initWithFrame:CGRectMake(0, self.vcheight-.5, self.vcwidth, .5)];
    line.backgroundColor = [UIColor lightGrayColor];
    line.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:line];
}

#pragma mark - setter
- (void)setDataDic:(NSDictionary *)dataDic {
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
        NSArray *listArray = [dataDic objectForKey:CTGScrollCellTitleArrayKey];
        if (listArray.count > 0) {
            self.scrollView.listArray = [NSMutableArray arrayWithArray:listArray];
            [self.scrollView reloadData];
        }
    }
}

@end
