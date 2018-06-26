//
//  CTGGoodsTitleScrollTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/15.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsTitleScrollTableViewCell.h"
#import "CTGImageScrollView.h"
#import "CTGCommonDefine.h"

@interface CTGGoodsTitleScrollTableViewCell ()

@property (nonatomic, strong) CTGImageScrollView *scrollView;

@end

@implementation CTGGoodsTitleScrollTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialView];
    }
    return self;
}

#pragma mark - private
- (void)initialView {
    self.scrollView = [[CTGImageScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.scrollView];
}

#pragma mark - setter
- (void)setDataDic:(NSDictionary *)dataDic {
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
        NSArray *listArray = [dataDic objectForKey:CTGScrollCellImageArrayKey];
        if (listArray.count > 0) {
            self.scrollView.listArray = [NSMutableArray arrayWithArray:listArray];
            [self.scrollView reloadData];
        }
    }
}


@end
