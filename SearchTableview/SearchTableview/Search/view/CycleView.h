//
//  CycleView.h
//  SearchTableview
//
//  Created by 李阳 on 16/3/14.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleView : UIView

@property (nonatomic,assign) float progress;
@property (nonatomic,assign) float rectwidth;
@property (nonatomic,strong) CAShapeLayer *progressLayer;

- (void)drawProgress:(CGFloat)progress;

@end
