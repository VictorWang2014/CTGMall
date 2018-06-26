//
//  CTGPersonalInfoTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/31.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGPersonalInfoTableViewCell.h"
#import "CTGCommonDefine.h"

@interface CTGPersonalInfoTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *personalImageView;
@property (strong, nonatomic) IBOutlet UILabel *personalNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *personalTagLabel;


@end

@implementation CTGPersonalInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(NSDictionary *)dic {
    self.personalNameLabel.text = [dic objectForKey:CTGCellTitleKey];
    self.personalTagLabel.text = [dic objectForKey:CTGCellSubTitleKey];
}

@end
