//
//  CTGOrderTableView.m
//  CTGMall
//
//  Created by admin on 2018/6/5.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGOrderTableView.h"
#import "CTGCommonDefine.h"
#import <objc/message.h>

@interface CTGOrderTableView () <UITableViewDelegate, UITableViewDataSource>

@end


@implementation CTGOrderTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [UIView new];
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.listArray objectAtIndex:indexPath.row];
    NSString *classString = [dic objectForKey:CTGCellClassKey];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:classString];
    if (cell == nil) {
        Class class = NSClassFromString(classString);
        BOOL isFromNib = [[dic objectForKey:CTGCellClassFromNIB] boolValue];
        if (isFromNib) {
            cell = [[[NSBundle mainBundle] loadNibNamed:classString owner:nil options:nil] firstObject];
        } else {
            cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:classString];
        }
    }
    if ([cell respondsToSelector:@selector(fillData:)]) {
        ((void(*)(id, SEL, NSDictionary *))objc_msgSend)(cell, @selector(fillData:), dic);
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.listArray objectAtIndex:indexPath.row];
    NSNumber *number = [dic objectForKey:CTGCellHeightKey];
    if (number) {
        return [number floatValue];
    }
    return 40;
}

@end







