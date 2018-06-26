//
//  CTGRecoverPasswordViewController.m
//  CTGMall
//
//  Created by admin on 2018/6/18.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGRecoverPasswordViewController.h"
#import "CTGRecoverPasswordModel.h"
#import "CTGCommonDefine.h"
#import "VCHeaders.h"
#import <objc/message.h>

@interface CTGRecoverPasswordViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
@property (nonatomic, strong) CTGRecoverPasswordModel *model;

@end

@implementation CTGRecoverPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"找回密码";
    self.model = [[CTGRecoverPasswordModel alloc] init];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [self.model.listArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.model.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [self.model.listArray objectAtIndex:section];
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [self.model.listArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    NSNumber *heightNum = [dic objectForKey:CTGCellHeightKey];
    if (heightNum) {
        return [heightNum floatValue];
    }
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIButton Action
- (IBAction)confirmButtonClick:(id)sender {
    
}


@end
