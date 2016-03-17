//
//  CycleViewController.m
//  SearchTableview
//
//  Created by 李阳 on 16/3/14.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "CycleViewController.h"
#import "CycleView.h"
#import "MyPoint.h"


@implementation CycleViewController
{
    UISlider *slider;
    CycleView *cycleView;
    float Pwidth;
    
    MKMapView *mkmapView;
    CLLocationManager *lcManager;
}

- (void)viewDidLoad{
    
//    self.title = @"绘画";
    
    Pwidth = 50;
    
    [self initSubViews];
    [self setLayout];
    
}

- (void)initSubViews{
    
    cycleView = [[CycleView alloc] init];
    cycleView.backgroundColor = [UIColor lightGrayColor];
    cycleView.progress = 0.33;
    cycleView.rectwidth = Pwidth;
    
    slider = [[UISlider alloc] init];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.33;
    [slider addTarget:self action:@selector(updateCycle:) forControlEvents:UIControlEventValueChanged];
    
    mkmapView = [[MKMapView alloc] init];
    mkmapView.mapType = MKMapTypeSatelliteFlyover;
    mkmapView.userTrackingMode = MKUserTrackingModeFollow;
//    mkmapView.centerCoordinate = CLLocationCoordinate2DMake(37.785834, -122.406417);
    mkmapView.delegate = self;
    mkmapView.showsUserLocation = YES;

    UITapGestureRecognizer *GR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(annotationAction:)];
    [mkmapView addGestureRecognizer:GR];
    GR.numberOfTapsRequired = 1;
    GR.delegate = self;
    
    
}

- (void)setLayout{
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    cycleView.frame = CGRectMake((screenSize.width-Pwidth*2)/2, 150, Pwidth*2, Pwidth*2);
    [self.view addSubview:cycleView];
    
    slider.frame = CGRectMake(20, 250, screenSize.width - 40, 20);
    [self.view addSubview:slider];
    
    mkmapView.frame = CGRectMake(0, 300, screenSize.width, 200);
    [self.view addSubview:mkmapView];
    
    
    
}

- (void)updateCycle:(id)sender{
    
    CGFloat f = slider.value;
    [cycleView drawProgress:f];
}

- (void)annotationAction:(id)sender{
    
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:37.785834 longitude:122.406417];
    CLLocationCoordinate2D coord = [loc coordinate];
    NSString *title = [NSString stringWithFormat:@"%f,%f",coord.latitude,coord.longitude];
    MyPoint *myPoint = [[MyPoint alloc] initWithCoordinate:coord andTitle:title];
    [mkmapView addAnnotation:myPoint];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [mkmapView setRegion:region animated:YES];
    
}

#pragma MKMapView delegate

///** 获取到新的位置信息时调用*/
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
//{
//    NSLog(@"定位到了");
//}
///** 不能获取位置信息时调用*/
//-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
//{
//    NSLog(@"获取定位失败");
//}



//调用非常频繁，不断监测用户的当前位置
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(nonnull MKUserLocation *)userLocation{
    
//    userLocation.title = @"天朝帝都";
//    userLocation.subtitle = @"是个很牛掰的地方!";
    
    CLLocationCoordinate2D loc = userLocation.coordinate;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [mapView setRegion:region animated:YES];
    
}

//地图的显示区域即将发生改变的时候调用
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
}

//地图的显示区域已经发生改变的时候调用
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
}




@end
