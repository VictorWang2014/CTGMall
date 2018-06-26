//
//  CTGShipAddressViewController.m
//  CTGMall
//
//  Created by admin on 2018/6/18.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGShipAddressViewController.h"
#import "CTGShipAddressModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"
#import <objc/message.h>

@interface CTGShipAddressViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (nonatomic, strong) CTGShipAddressModel *model;

@end

@implementation CTGShipAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"收货地址";
    self.model = [[CTGShipAddressModel alloc] init];
    // Do any additional setup after loading the view from its nib.
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIButton Action
- (IBAction)saveButtonClick:(id)sender {
    
}

- (IBAction)cancelButtonClick:(id)sender {
    
}

@end
