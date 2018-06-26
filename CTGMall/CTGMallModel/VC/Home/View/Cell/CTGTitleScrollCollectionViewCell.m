//
//  CTGTitleScrollCollectionViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/8.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGTitleScrollCollectionViewCell.h"
#import "VCHeaders.h"
#import "CTGImageScrollView.h"
#import "CTGCommonDefine.h"

@interface CTGTitleScrollCollectionViewCell () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) CTGImageScrollView *scrollView;
@property (nonatomic, strong) VCButton *firstButton;
@property (nonatomic, strong) VCButton *secondButton;
@property (nonatomic, strong) VCButton *thirdButton;
@property (nonatomic, strong) VCButton *forthButton;

@end

@implementation CTGTitleScrollCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialView];
    }
    return self;
}

#pragma mark - private
- (void)initialView {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.vcwidth, 45)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入您要搜索的商品";
    [self addSubview:self.searchBar];
    
    self.scrollView = [[CTGImageScrollView alloc] initWithFrame:CGRectMake(0, self.searchBar.vcmaxY, self.vcwidth, 200)];
    [self addSubview:self.scrollView];
    
    self.firstButton = [self buttonWithFrame:CGRectMake(0, self.scrollView.vcmaxY, self.vcwidth/4, 125) title:@"分类" selector:@selector(firstButtonClick:)];
    [self addSubview:self.firstButton];

    self.secondButton = [self buttonWithFrame:CGRectMake(self.vcwidth/4, self.scrollView.vcmaxY, self.vcwidth/4, 125) title:@"订单" selector:@selector(secondButtonClick:)];
    [self addSubview:self.secondButton];

    self.thirdButton = [self buttonWithFrame:CGRectMake(self.vcwidth/2, self.scrollView.vcmaxY, self.vcwidth/4, 125) title:@"收藏" selector:@selector(thirdButtonClick:)];
    [self addSubview:self.thirdButton];
    
    self.forthButton = [self buttonWithFrame:CGRectMake(self.vcwidth*3/4, self.scrollView.vcmaxY, self.vcwidth/4, 125) title:@"购物车" selector:@selector(forthButtonClick:)];
    [self addSubview:self.forthButton];
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

#pragma mark - UIButtonAction
- (void)firstButtonClick:(UIButton *)button {
    
}

- (void)secondButtonClick:(UIButton *)button {
    
}

- (void)thirdButtonClick:(UIButton *)button {
    
}

- (void)forthButtonClick:(UIButton *)button {
    
}

#pragma mark - private
- (VCButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title selector:(SEL)selector {
    VCButton *button = [VCButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    float imageOriginY = 10;
    float imageWidth = 50;
    button.vcimageRect = CGRectMake((frame.size.width-imageWidth)/2, imageOriginY, imageWidth, imageWidth);
    float titleHeight = 20;
    float titleOriginY = imageWidth+20+imageOriginY;
    button.vctitleRect = CGRectMake(0, titleOriginY, frame.size.width, titleHeight);

    [button setImage:[UIImage imageNamed:@"tabbar_home"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
