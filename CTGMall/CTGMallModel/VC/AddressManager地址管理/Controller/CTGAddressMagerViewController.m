//
//  CTGAddressMagerViewController.m
//  CTGMall
//
//  Created by admin on 2018/6/13.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGAddressMagerViewController.h"
#import "CTGAddressModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"
#import <objc/message.h>

@interface CTGAddressMagerViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CTGAddressModel *model;

@end

@implementation CTGAddressMagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"地址管理";
    self.model = [[CTGAddressModel alloc] init];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.model.listArray objectAtIndex:indexPath.row];
    NSString *classString = [dic objectForKey:CTGCellClassKey];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:classString];
    Class class = NSClassFromString(classString);
    if (cell == nil) {
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
    return self.model.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.model.listArray objectAtIndex:indexPath.row];
    NSNumber *heightNum = [dic objectForKey:CTGCellHeightKey];
    if (heightNum) {
        return [heightNum floatValue];
    }
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
