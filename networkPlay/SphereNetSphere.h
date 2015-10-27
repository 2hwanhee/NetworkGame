//
//  SphereNetSphere.h
//  networkPlay
//
//  Created by 이환희 on 2015. 10. 27..
//  Copyright © 2015년 hwanhee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface SphereNetSphere : NSObject
{
    float _r, _g, _b;
    CALayer *_layer;
    NSTimeInterval _lastUpdate;
}

- (void)setColorR:(float)r g:(float)g b:(float)b;

- (float)r;
- (float)g;
- (float)b;

- (void)setPosition:(CGPoint)p;
- (CGPoint)position;

- (CALayer *)layer;
- (NSTimeInterval)lastUpdate;


@end
