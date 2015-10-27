//
//  SphereNetSphere.m
//  networkPlay
//
//  Created by 이환희 on 2015. 10. 27..
//  Copyright © 2015년 hwanhee. All rights reserved.
//

#import "SphereNetSphere.h"

static const CGFloat kSphereSize = 40;
static const CGFloat kSphereCenterOffset = 10;

@implementation SphereNetSphere

- (id)init{
    self = [super init];
    if(self){
        _layer = [[CALayer alloc]init];
        [_layer setDelegate:self];
        [_layer setBounds:CGRectMake(0, 0, kSphereSize, kSphereSize)];
        [_layer setNeedsDisplay];
    }
    
    return self;
}

- (void)setColorR:(float)r g:(float)g b:(float)b{
    if(r != _r || g != _g || b != _b){
        _r = r;
        _g = g;
        _b = b;
        
        [_layer setNeedsDisplay];
    }
}

- (float)r{
    return _r;
}
- (float)g{
    return _g;
}
- (float)b{
    return _b;
}

- (void)setPosition:(CGPoint)p{
    [_layer setPosition:p];
    _lastUpdate = [NSDate timeIntervalSinceReferenceDate];
}

- (CGPoint)position{
    return  [_layer position];
}

- (CALayer *)layer{
    return _layer;
}

- (NSTimeInterval)lastUpdate{
    return _lastUpdate;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGFloat location[2] = {0.0, 1.0};
    CGFloat components[8] = {_r,_g,_b,1.0,_r,_g,_b,0.7};
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, location, 2);
    
    CGPoint offsetCenter = CGPointMake(kSphereSize/2 - kSphereCenterOffset, kSphereSize/2 - kSphereCenterOffset);
    CGPoint center = CGPointMake(kSphereSize/2, kSphereSize/2);
    CGContextDrawRadialGradient(    ctx,
                                    gradient,
                                    offsetCenter,
                                    0,
                                    center,
                                    kSphereSize/2,
                                    0);
    CFRelease(gradient);
    CFRelease(colorSpace);
    
}
@end
