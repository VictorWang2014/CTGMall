//
//  CTGPersonalTagTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/5/31.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGPersonalTagTableViewCell.h"
#import "CTGCommonDefine.h"

@interface CTGPersonalTagTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *tagImageView;
@property (strong, nonatomic) IBOutlet UILabel *tagLabel;

@end

@implementation CTGPersonalTagTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)fillData:(NSDictionary *)dic {
    self.tagLabel.text = [dic objectForKey:CTGCellTitleKey];
}


@end
