//
//  ViewController.m
//  networkPlay
//
//  Created by 이환희 on 2015. 10. 27..
//  Copyright © 2015년 hwanhee. All rights reserved.
//

#import "ViewController.h"
#import "SphereNetSphere.h"

#pragma mark -
#pragma mark - Packet

typedef struct{
    uint32_t identifier;
    uint32_t datatype;
}PacketHeader;

#pragma pack(1)
typedef struct{
    PacketHeader header;
    int32_t x;
    int32_t y;
    uint8_t r;
    uint8_t g;
    uint8_t b;
}PositionPacket;
#pragma option align=reset

@interface ViewController ()

@end

@implementation ViewController

static const uint32_t kSphereNetPositionPacketType = 'posn';

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if(!_localSphere){
        _localSphere = [[SphereNetSphere alloc]init];
        CGSize size = self.view.bounds.size;
        srandomdev();
        [_localSphere setColorR:[self randomFloat] g:[self randomFloat] b:[self randomFloat]];
        [_localSphere setPosition:CGPointMake(size.width/2, size.height/2)];
        [self.view.layer addSublayer:[_localSphere layer]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)randomFloat{
    CGFloat randomFloat = ((CGFloat)random()/((1<<30) - 1));
    NSLog(@"%f",randomFloat);
    return randomFloat;
}

#pragma mark -
#pragma mark - Touch

- (void)moveLocalSphereFromTouch:(UITouch *)touch{
    if(touch){
        [_localSphere setPosition:[touch locationInView:self.view]];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self moveLocalSphereFromTouch:[touches anyObject]];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self moveLocalSphereFromTouch:[touches anyObject]];
}
@end
