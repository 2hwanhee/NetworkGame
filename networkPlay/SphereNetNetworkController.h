//
//  SphereNetNetworkController.h
//  networkPlay
//
//  Created by 이환희 on 2015. 10. 27..
//  Copyright © 2015년 hwanhee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SphereNetSphere, SphereNetNetworkController;

@protocol SphereNetNetworkControllerDelegate <NSObject>

typedef struct{
    float r,g,b;
    CGPoint position;
}SphereNetSphereUpdate;

- (void)networkController:(SphereNetNetworkController *)controller didReceiveUpdate:(SphereNetSphereUpdate)update fromAddress:(NSData *)address;

@end

@interface SphereNetNetworkController : UIViewController

- (id)initWithDelegate:(id<SphereNetNetworkControllerDelegate>)delegate;
- (void)localSphereDidMove:(SphereNetSphere *)sphere;

@end
