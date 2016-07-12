//
//  GKPopScrollView.m
//  GKPopScrollViewDemo
//
//  Created by guoke on 16/7/12.
//  Copyright © 2016年 guoke. All rights reserved.
//

#import "GKPopScrollView.h"

@interface GKPopScrollView ()

@property (nonatomic, assign) NSInteger touchX;
@end

@implementation GKPopScrollView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.maxTouchPointX = 50;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    self.touchX = (NSInteger) point.x % (NSInteger) [[UIScreen mainScreen] bounds].size.width;
    if (point.y < 0) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (self.touchX <= self.maxTouchPointX) {
        return NO;
    }
    return YES;
}
@end
