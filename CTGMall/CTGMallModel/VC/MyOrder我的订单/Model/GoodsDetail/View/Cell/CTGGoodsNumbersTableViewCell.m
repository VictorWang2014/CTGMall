//
//  CTGGoodsNumbersTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/16.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGGoodsNumbersTableViewCell.h"
#import "VCHeaders.h"

@interface CTGGoodsNumbersTableViewCell ()

@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UIButton *minusButton;
@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UITextField *inputField;

@end

@implementation CTGGoodsNumbersTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 30, self.vcheight)];
        self.tagLabel.font = [UIFont systemFontOfSize:14];
        self.tagLabel.textColor = [UIColor blackColor];
        self.tagLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.tagLabel.text = @"数量";
        [self addSubview:self.tagLabel];
        self.minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.minusButton.frame = CGRectMake(self.tagLabel.vcmaxX+20, 0, 25, self.vcheight);
        self.minusButton.backgroundColor = [UIColor redColor];
        self.minusButton.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.minusButton addTarget:self action:@selector(minusButtonClick:)
                   forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.minusButton];
        
        self.inputField = [[UITextField alloc] initWithFrame:CGRectMake(self.minusButton.vcmaxX+10, (self.vcheight-35)/2, 50, 35)];
        self.inputField.backgroundColor = [UIColor yellowColor];
        self.inputField.font = [UIFont systemFontOfSize:14];
        self.inputField.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:self.inputField];
        
        self.plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.plusButton.frame = CGRectMake(self.inputField.vcmaxX+10, 0, 25, self.vcheight);
        self.plusButton.backgroundColor = [UIColor redColor];
        self.plusButton.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.plusButton addTarget:self action:@selector(plusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.plusButton];
    }
    return self;
}

- (void)minusButtonClick:(UIButton *)button {
    
}

- (void)plusButtonClick:(UIButton *)button {
    
}

@end
