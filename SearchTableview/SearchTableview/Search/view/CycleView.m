//
//  CycleView.m
//  SearchTableview
//
//  Created by 李阳 on 16/3/14.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "CycleView.h"

@implementation CycleView
{
    UILabel *progressLab;
    CALayer *gradientLayer;
    CAGradientLayer *leftLayer;
    CAGradientLayer *rightLayer;
}

- (void)initLabel{
    
    if (!progressLab) {
        
        progressLab = [[UILabel alloc] initWithFrame:CGRectMake((self.bounds.size.width-_rectwidth*1.6)/2, (self.bounds.size.height-30)/2, _rectwidth*1.6, 30)];
        
        [self addSubview:progressLab];
        
        progressLab.font = [UIFont boldSystemFontOfSize:18.0];
        
        progressLab.textAlignment = NSTextAlignmentCenter;
        
    }
    
    progressLab.text = [NSString stringWithFormat:@"%0.2f%%",_progress*100];
    
}

- (void)initGradientLayer{
    
    gradientLayer = [CALayer layer];
    
    leftLayer = [CAGradientLayer layer];
    leftLayer.locations = @[@0.3,@0.9,@1];
    leftLayer.colors = @[(id)[UIColor greenColor].CGColor,(id)[UIColor yellowColor].CGColor];
    
    rightLayer = [CAGradientLayer layer];
    rightLayer.locations = @[@0.3,@0.9,@1];
    rightLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor];
    
    leftLayer.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height);
    [gradientLayer addSublayer:leftLayer];
    
    rightLayer.frame = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height);
    [gradientLayer addSublayer:rightLayer];
    
    
    [gradientLayer setMask:_progressLayer];
    [self.layer addSublayer:gradientLayer];
    
}

- (void)initProgress{
    
    CGPoint center = CGPointMake(_rectwidth, _rectwidth);
    
    CGFloat radius = _rectwidth-10;//这是半径，不是弧度
    
    CGFloat startA = - M_PI_2;
    
    CGFloat endA = - M_PI_2 + M_PI * 2 * _progress;
    
    _progressLayer = [CAShapeLayer layer];
    
    _progressLayer.frame = self.bounds;
    
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    
    _progressLayer.strokeColor = [UIColor redColor].CGColor;
    
    _progressLayer.opacity = 1;
    
    //    _progressLayer.lineCap = kCALineCapRound;
    
    _progressLayer.lineWidth = 10;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    _progressLayer.path = path.CGPath;
    
    
}

- (void)drawRect:(CGRect)rect{
    
    [self initProgress];
    
    [self initGradientLayer];
    
    [self initLabel];
    
}

- (void)drawProgress:(CGFloat)progress{
    
    _progress = progress;
    
    _progressLayer.opacity = 0;
    
    [self setNeedsDisplay];
    
}



@end
