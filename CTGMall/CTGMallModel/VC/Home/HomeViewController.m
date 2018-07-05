//
//  HomeViewController.m
//  CTGMall
//
//  Created by admin on 2018/5/7.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "VCTestViewController.h"
#import "CTGGoodsDetailViewController.h"
#import "CTGMyOrderViewController.h"
#import "CTGConfirmOrderViewController.h"
#import "CTGAddressMagerViewController.h"
#import "CTGShipAddressViewController.h"
#import "CTGRecoverPasswordViewController.h"

#import "HomeViewController.h"
#import <objc/message.h>
#import "HomeModel.h"
#import "CTGHomeRequest.h"
#import "CTGHomeDataAdaptor.h"
#import "HomeHeaders.h"
#import "VCHeaders.h"
#import "CTGCommonDefine.h"

@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    
}

@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, strong) HomeModel *model;
@property (nonatomic, strong) CTGHomeRequest *request;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[HomeModel alloc] init];
    self.request = [[CTGHomeRequest alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
    self.collectView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectView];
    
    UIBarButtonItem *rightTest = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStylePlain target:self action:@selector(test)];
    self.navigationItem.rightBarButtonItem = rightTest;
    [self registerCollectionCellClass];
    
    [self.request requestHomeBannerSuccess:^(id data) {
        NSDictionary *object = [CTGHomeDataAdaptor adaptorTitleBannerWithJsonObject:data];
        
    } failure:^(id data) {
        
    }];
}

- (void)test {
//    CTGGoodsDetailViewController *vc = [[CTGGoodsDetailViewController alloc] init];
//    CTGMyOrderViewController *vc = [[CTGMyOrderViewController alloc] init];
//    CTGConfirmOrderViewController *vc = [[CTGConfirmOrderViewController alloc] initWithNibName:@"CTGConfirmOrderViewController" bundle:nil];
//    CTGRecoverPasswordViewController *vc = [[CTGRecoverPasswordViewController alloc] init];
    VCTestViewController *vc = [[VCTestViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource UICollectionViewDelegateFlowLayout
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [self.model.listArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[dic objectForKey:CTGCellClassKey] forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(setDataDic:)]) {
        ((void(*)(id,SEL,NSDictionary *))objc_msgSend)(cell, @selector(setDataDic:), dic);
    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([[self.model.listArray objectAtIndex:section] isKindOfClass:[NSArray class]]) {
        return [[self.model.listArray objectAtIndex:section] count];
    }
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.model.listArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [self.model.listArray objectAtIndex:indexPath.section];
    if ([array isKindOfClass:[NSArray class]]) {
        NSDictionary *dic = [array objectAtIndex:indexPath.row];
        NSString *classString = [dic objectForKey:CTGCellClassKey];
        float height = [[dic objectForKey:CTGCellHeightKey] floatValue];
        if ([classString isEqualToString:@"CTGTitleScrollCollectionViewCell"]) {
            return CGSizeMake(collectionView.vcwidth, height);
        } else if ([classString isEqualToString:@"CTGNoticeScrollCollectionViewCell"]) {
            return CGSizeMake(collectionView.vcwidth, height);
        } else if ([classString isEqualToString:@"CTGHomeDefaultTitleCollectionViewCell"]) {
            return CGSizeMake(collectionView.vcwidth, height);
        } else if ([classString isEqualToString:@"CTGGoodsCollectionViewCell"]) {
            return CGSizeMake(collectionView.vcwidth/2, height);
        }
    }
    return CGSizeZero;
}

#pragma mark - private
- (void)registerCollectionCellClass {
    NSArray *classArray = [self.model collectionCellClassArray];
    [classArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *classString = (NSString *)obj;
        [self.collectView registerClass:NSClassFromString(classString) forCellWithReuseIdentifier:classString];
    }];
}

@end
