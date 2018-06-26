//
//  CTGConfirmOrderViewController.m
//  CTGMall
//
//  Created by admin on 2018/6/10.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGConfirmOrderViewController.h"
#import "CTGComfirmOrderModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"
#import <objc/message.h>

@interface CTGConfirmOrderViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CTGComfirmOrderModel *model;

@end

@implementation CTGConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"确认订单";
    self.model = [[CTGComfirmOrderModel alloc] init];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.vcwidth, self.view.vcheight-43) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.tableView.vcmaxY, self.view.vcwidth*3/5.0-10, 23)];
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"¥0.01";
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.tableView.vcmaxY+20, self.view.vcwidth*3/5.0-10, 23)];
    label.textAlignment = NSTextAlignmentRight;
    label.text = @"已优惠¥0.01";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"提交订单并支付" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(self.view.vcwidth*3/5.0, self.tableView.vcmaxY, self.view.vcwidth*2/5.0, 43);
    [self.view addSubview:button];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.model.listArray objectAtIndex:indexPath.section];
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
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.model.listArray objectAtIndex:indexPath.section];
    NSNumber *heightNum = [dic objectForKey:CTGCellHeightKey];
    if (heightNum) {
        return [heightNum floatValue];
    }
    return 48;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.model.listArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)buttonClick:(UIButton *)button {
    
}

@end
