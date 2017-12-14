//
//  ADSVehicleModel.m
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import "ADSVehicleModel.h"

@implementation VehicleBrand

static VehicleBrand * instance = nil;

+ (VehicleBrand *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[VehicleBrand alloc]init];
        }
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        _allBrands = [[NSMutableArray alloc]init];
    }
    return self;
}
//- (NSMutableArray<NSDictionary *> *)allBrands
//{
//    if (_allBrands) {
//        _allBrands = [[NSMutableArray alloc]init];
//    }
//    return _allBrands;
//}
@end

@implementation VehicleSeries

@end

@implementation VehicleProductionYear

@end


