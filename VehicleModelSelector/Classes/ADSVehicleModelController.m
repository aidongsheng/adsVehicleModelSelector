//
//  ADSVehicleModelController.m
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import "ADSVehicleModelController.h"
#import "ADSVehicleRequest.h"

@interface ADSVehicleModelController ()

@end

@implementation ADSVehicleModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    ADSVehicleRequest * request = [[ADSVehicleRequest alloc]init];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseString);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.error.description);
    }];
}

@end
