//
//  UIColor+Util.h
//  SearchTableview
//
//  Created by 李阳 on 16/1/27.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

#pragma mark - Hex
+(UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+(UIColor *)colorWithHex:(int)hexValue;
#pragma mark - theme colors
+(UIColor *)TitleColor;
+(UIColor *)InfoTextColor;

@end
