//
//  ViewController.m
//  CuteButton
//
//  Created by 我的宝宝 on 15/7/21.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "ViewController.h"
#import "CuteLayerSector.h"
#import "CuteButton.h"

@interface ViewController () {
 
    UIView *_customView;
    
    UIButton *_touch;
    CuteButton *_cuteButton;
    CuteLayerSector *_layerSector;
    
    BOOL isChange;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _cuteButton = [[CuteButton alloc]initWithFrame:CGRectMake(50, 180, 100, 100)];
    _cuteButton.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_cuteButton];
    
    
    //UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(240, 160) radius:100 startAngle:(0/180.0)*M_PI endAngle:((0-1)/(180.0))*M_PI clockwise:YES];
    
    CGFloat x = CGRectGetMaxX(_cuteButton.frame);
    CGFloat y = CGRectGetMaxY(_cuteButton.frame);
    
    //新建直线路径
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathMoveToPoint(path1, NULL, 0, 0);
    CGPathAddLineToPoint(path1, NULL, x, y);
    CGPathMoveToPoint(path1, NULL, x, y);
    CGPathAddLineToPoint(path1, NULL, 0.9 * x, 0.9 * y);
    CGPathMoveToPoint(path1, NULL, 0.9 * x, 0.9 * y);
    CGPathAddLineToPoint(path1, NULL, x, y);
    CGPathMoveToPoint(path1, NULL, x, y);
    UIBezierPath * path = [UIBezierPath bezierPathWithCGPath:path1];
    
    
    //动画效果
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    orbit.path = path.CGPath;
    orbit.calculationMode = kCAAnimationCubic;
    orbit.duration = 0.8;
    orbit.repeatCount = 1;
    
    [_cuteButton.layer addAnimation:orbit forKey:@"orbit"];
    
    
    CGPoint center = self.view.center;
    _touch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _touch.frame = CGRectMake(center.x - 75, 500, 150, 30);
    _touch.layer.cornerRadius = 15.0;
    _touch.layer.masksToBounds = YES;
    [_touch setTitle:@"触摸按钮" forState:UIControlStateNormal];
    [_touch setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_touch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_touch setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:_touch];
    
    [_touch addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    isChange = false;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touch:)];
    [self.view addGestureRecognizer:tap];
}
- (void)touch:(UITapGestureRecognizer *)tap {
    if ([_cuteButton.layer.presentationLayer hitTest:[tap locationInView:self.view]]) {
           NSLog(@"I touched. MD");
    }
 
}

- (void)touch {
    isChange = !isChange;
    if (isChange == true) {
            _cuteButton.frame = CGRectMake(50, 180, 200, 200);
        _cuteButton.layer.mask.frame = _cuteButton.bounds;
        [_cuteButton.layer.mask setNeedsDisplay];
    }else {
            _cuteButton.frame = CGRectMake(50, 180, 100, 100);
                _cuteButton.layer.mask.frame = _cuteButton.bounds;
        [_cuteButton.layer.mask setNeedsDisplay];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
