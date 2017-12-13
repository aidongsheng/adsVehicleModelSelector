//
//  adsViewController.m
//  VehicleModelSelector
//
//  Created by 18606563661@163.com on 12/13/2017.
//  Copyright (c) 2017 18606563661@163.com. All rights reserved.
//

#import "adsViewController.h"
#import "ADSVehicleRequest.h"

@interface adsViewController ()

@end

@implementation adsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSString * brand = @"大众";
    NSString * series = @"速腾";
    ADSVehicleRequest * request = [[ADSVehicleRequest alloc]initWithBrand:brand series:series];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"response:%@",request.responseString);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"error:%@",request.error);
    }];
}
@end
