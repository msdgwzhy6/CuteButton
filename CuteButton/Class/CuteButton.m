//
//  CuteButton.m
//  CuteButton
//
//  Created by 我的宝宝 on 15/7/21.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "CuteButton.h"
#import "CuteLayerSector.h"

@interface CuteButton() {
 
    CALayer *_contentLayer;
    CuteLayerSector *_maskLayer;
}
@end

@implementation CuteButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initSubLayer];
    }
    
    return self;
}


- (void)initSubLayer {
    
    _maskLayer = [CuteLayerSector layer];
    _maskLayer.frame = self.bounds;
    [_maskLayer setNeedsDisplay];
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.frame;

    //_contentLayer.contents = (id)[UIImage imageNamed:@"activity"].CGImage;
    
    [self setValue:_contentLayer forKey:@"layer"];

    //UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(240, 160) radius:100 startAngle:(0/180.0)*M_PI endAngle:((0-1)/(180.0))*M_PI clockwise:YES];
    
    CGFloat x = self.frame.origin.x + CGRectGetWidth(self.frame)/2;
    CGFloat y = self.frame.origin.y + CGRectGetHeight(self.frame)/2;
    
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
    orbit.keyTimes = [[NSArray alloc]initWithObjects:[NSNumber numberWithDouble:0.0],
                    [NSNumber numberWithDouble:0.5],
                    [NSNumber numberWithDouble:0.7],
                    [NSNumber numberWithDouble:0.9],
                      [NSNumber numberWithDouble:1.0],nil];
    orbit.duration = 1.2;
    orbit.repeatCount = 1;
    
    [self.layer addAnimation:orbit forKey:@"orbit"];
    
    
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touch:)];
    [self addGestureRecognizer:tap];
}

- (void)touch:(UITapGestureRecognizer *)tap {

        NSLog(@"I touched. MD");

}


@end
