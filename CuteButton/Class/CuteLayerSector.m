//
//  CuteLayerSector.m
//  CuteButton
//
//  Created by 我的宝宝 on 15/7/21.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "CuteLayerSector.h"

@implementation CuteLayerSector

- (void)drawInContext:(CGContextRef)ctx {
    
    /*
    //画扇形
    CGContextMoveToPoint(ctx, 105, 160);
    CGContextAddArc(ctx, 105, 160, 120, -45 * M_PI / 180, -135 * M_PI / 180, 1);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //填充颜色
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
     */
    
    [self setup];
    

}

- (void)setup {
    CGFloat x = CGRectGetMaxX(self.frame);
    CGFloat y = CGRectGetMaxY(self.frame);
    CGFloat radius = self.frame.size.width;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, x, y);
    //CGPathAddArc(path, NULL, 50, 50, 40, -45 * M_PI / 180, -135 * M_PI / 180, 1);
    CGPathAddArc(path, NULL, x, y, radius,  180 * M_PI / 180, -90 * M_PI / 180, 0);
    //    CGPathAddEllipseInRect(path, NULL, CGRectMake(50, 50, 100, 100));
    //    CGPoint origin = self.bounds.origin;
    //    CGFloat radius = CGRectGetWidth(self.bounds) / 2;
    //    CGPathMoveToPoint(path, NULL, origin.x, origin.y + 2 *radius);
    //    CGPathMoveToPoint(path, NULL, origin.x, origin.y + radius);
    //
    //    CGPathAddArcToPoint(path, NULL, origin.x, origin.y, origin.x + radius, origin.y, radius);
    //    CGPathAddArcToPoint(path, NULL, origin.x + 2 * radius, origin.y, origin.x + 2 * radius, origin.y + radius, radius);
    //    CGPathAddArcToPoint(path, NULL, origin.x + 2 * radius, origin.y + 2 * radius, origin.x + radius, origin.y + 2  * radius, radius);
    //    CGPathAddLineToPoint(path, NULL, origin.x, origin.y + 2 * radius);
    
    
    self.path = path;
    self.fillColor = [UIColor blackColor].CGColor;
    self.strokeColor = [UIColor clearColor].CGColor;
    self.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    self.contentsScale = [UIScreen mainScreen].scale;                 //非常关键设置自动拉伸的效果且不变形
}

@end
