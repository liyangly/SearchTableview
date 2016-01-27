//
//  SearchCell.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/27.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "SearchCell.h"
#import "UIColor+Util.h"
@implementation SearchCell

- (void)awakeFromNib {
    _TypeName.font = [UIFont systemFontOfSize:14.0];
    _TypeName.textColor = [UIColor TitleColor];
    _InfoText.font = [UIFont systemFontOfSize:14.0];
    _InfoText.textColor = [UIColor InfoTextColor];
    _TimeLab.font = [UIFont systemFontOfSize:14.0];
    _TimeLab.textColor = [UIColor InfoTextColor];
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
