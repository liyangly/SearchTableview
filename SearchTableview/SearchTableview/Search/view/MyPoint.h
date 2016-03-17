//
//  MyPoint.h
//  SearchTableview
//
//  Created by 李阳 on 16/3/17.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyPoint : NSObject<MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic,copy) NSString *title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString *)t;

@end
