//
//  UIColor+Util.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/27.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+(UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF0000) >> 8))/255.0
                           blue:((float)(hexValue & 0xFF0000))/255.0
                           alpha:alpha];
}

+(UIColor *)colorWithHex:(int)hexValue{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+(UIColor *)TitleColor{
    return [UIColor colorWithHex:0x666666];
}

+(UIColor *)InfoTextColor{
    return [UIColor colorWithHex:0x333333];
}

@end
