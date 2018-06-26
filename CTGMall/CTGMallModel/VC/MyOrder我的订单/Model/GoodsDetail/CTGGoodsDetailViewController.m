//
//  CTGGoodsDetailViewController.m
//  CTGMall
//
//  Created by admin on 2018/5/15.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsDetailViewController.h"
#import "GoodsModel.h"
#import "CTGCommonDefine.h"
#import <objc/message.h>

@interface CTGGoodsDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GoodsModel *model;


@end

@implementation CTGGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [[GoodsModel alloc] init];
    // Do any additional setup after loading the view.
    self.title = @"商品详情";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [self.model.listArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    NSString *classString = [dic objectForKey:CTGCellClassKey];
    Class class = NSClassFromString(classString);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:classString];
    if (cell == nil) {
        cell = [[class alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:classString];
    }
    if ([cell respondsToSelector:@selector(setDataDic:)]) {
        ((void(*)(id,SEL,NSDictionary *))objc_msgSend)(cell, @selector(setDataDic:), dic);
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [self.model.listArray objectAtIndex:section];
    return array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.model.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.model.listArray.count == section+1) {
        return 0;
    }
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [self.model.listArray objectAtIndex:indexPath.section];
    if ([array isKindOfClass:[NSArray class]]) {
        NSDictionary *dic = [array objectAtIndex:indexPath.row];
        float height = [[dic objectForKey:CTGCellHeightKey] floatValue];
        return height;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
