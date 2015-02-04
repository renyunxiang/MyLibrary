//
//  OOMapViewController.h
//  OOCity
//
//  Created by liu jian on 15/2/3.
//  Copyright (c) 2015年 liu jian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface OOMapViewController : UIViewController 
typedef void (^DIDOk)(CLLocationCoordinate2D coor);
@property(nonatomic,copy) DIDOk didOk;
@end
