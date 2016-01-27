//
//  SearchCell.h
//  SearchTableview
//
//  Created by 李阳 on 16/1/27.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *TypeImage;
@property (weak, nonatomic) IBOutlet UILabel *TypeName;
@property (weak, nonatomic) IBOutlet UILabel *InfoText;
@property (weak, nonatomic) IBOutlet UILabel *TimeLab;

@end
