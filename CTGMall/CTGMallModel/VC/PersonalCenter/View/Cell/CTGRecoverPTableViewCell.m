//
//  CTGRecoverPTableViewCell.m
//  CTGMall
//
//  Created by admin on 2018/6/18.
//  Copyright © 2018年 DiZiCompanyLimited. All rights reserved.
//

#import "CTGRecoverPTableViewCell.h"
#import "VCHeaders.h"
#import "CTGCommonDefine.h"

@interface CTGRecoverPTableViewCell ()

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *button;
@end


@implementation CTGRecoverPTableViewCell

- (void)fillData:(id)data {
    NSDictionary *dic = (NSDictionary *)data;
    BOOL isSecret = [dic objectForKey:CTGRecoverPasswordCellIsSecretKey];
    BOOL isShowButton = [dic objectForKey:CTGRecoverPasswordCellShowButtonKey];
    self.textField.secureTextEntry = isSecret?YES:NO;
    self.button.hidden = !isShowButton?YES:NO;
    self.textField.placeholder = [dic objectForKey:CTGCellPlaceHoldKey];
}

#pragma mark - UIButton Action
- (IBAction)buttonClick:(id)sender {

}

@end
