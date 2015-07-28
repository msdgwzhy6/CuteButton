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
    NSLog(@"yap, I'm coming.");
    
    _maskLayer = [CuteLayerSector layer];
    _maskLayer.frame = self.bounds;
    [_maskLayer setNeedsDisplay];
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.frame;
    _contentLayer.contents = (id)[UIImage imageNamed:@"activity"].CGImage;

    //[self.layer addSublayer:_contentLayer];
    
    [self setValue:_contentLayer forKey:@"layer"];
    self.userInteractionEnabled = NO;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touch:)];
    [self addGestureRecognizer:tap];
}

- (void)touch:(UITapGestureRecognizer *)tap {
    NSLog(@"I touched. MD");
}

@end
