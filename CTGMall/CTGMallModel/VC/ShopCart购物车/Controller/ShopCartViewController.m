//
//  ShopCartViewController.m
//  CTGMall
//
//  Created by admin on 2018/5/7.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "ShopCartViewController.h"
#import "CTGShopCartModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"
#import <objc/message.h>

@interface ShopCartViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *allSelectButton;
@property (nonatomic, strong) UIButton *completeButton;
@property (nonatomic, strong) UILabel *completeLabel;
@property (nonatomic, strong) CTGShopCartModel *model;

@end

@implementation ShopCartViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, self.view.vcwidth, self.view.vcheight-43);
    self.allSelectButton.frame = CGRectMake(0, self.tableView.vcmaxY, self.view.vcwidth*3/5.0-10, 43);
    self.completeLabel.frame = CGRectMake(0, self.tableView.vcmaxY, self.view.vcwidth*3/5.0-10, 43);
    self.completeButton.frame = CGRectMake(self.view.vcwidth*3/5.0, self.tableView.vcmaxY, self.view.vcwidth*2/5.0, 43);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    self.view.backgroundColor = [UIColor whiteColor];
    self.model = [[CTGShopCartModel alloc] init];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.vcwidth, self.view.vcheight-43) style:UITableViewStylePlain];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    
    self.allSelectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.allSelectButton setTitle:@"全选" forState:UIControlStateNormal];
    [self.allSelectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.allSelectButton.backgroundColor = [UIColor grayColor];
    [self.allSelectButton addTarget:self action:@selector(allSelectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.allSelectButton.frame = CGRectMake(0, self.tableView.vcmaxY, self.view.vcwidth*3/5.0-10, 43);
    [self.view addSubview:self.allSelectButton];

    self.completeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.tableView.vcmaxY, self.view.vcwidth*3/5.0-10, 43)];
    self.completeLabel.textAlignment = NSTextAlignmentRight;
    self.completeLabel.font = [UIFont systemFontOfSize:17];
    self.completeLabel.text = @"¥0.01";
    self.completeLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.completeLabel];
    self.completeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.completeButton setTitle:@"结算（0）" forState:UIControlStateNormal];
    [self.completeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.completeButton.backgroundColor = [UIColor grayColor];
    [self.completeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.completeButton.frame = CGRectMake(self.view.vcwidth*3/5.0, self.tableView.vcmaxY, self.view.vcwidth*2/5.0, 43);
    [self.view addSubview:self.completeButton];
}

#pragma mark - UIButton Action
- (void)allSelectButtonClick:(UIButton *)button {
    
}

- (void)buttonClick:(UIButton *)button {
    
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

@end
