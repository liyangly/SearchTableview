//
//  MyPoint.m
//  SearchTableview
//
//  Created by 李阳 on 16/3/17.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint

- (id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString *)t{
    
    self = [super init];
    if (self) {
        _coordinate = c;
        _title = t;
    }
    
    return self;
    
}

@end
