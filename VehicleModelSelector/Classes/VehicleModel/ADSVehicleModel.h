//
//  VehicleBrand.h
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import <Foundation/Foundation.h>
@class VehicleSeries;
@class VehicleProductionYear;

@interface VehicleBrand : NSObject
@property (nonatomic,strong) NSMutableArray<NSDictionary *> * allBrands;

+ (VehicleBrand *)shareInstance;

@end

@interface VehicleSeries : NSObject
@property (nonatomic,strong) NSMutableArray<NSString *> * allSeries;
@end

@interface VehicleProductionYear : NSObject
@property (nonatomic,strong) NSMutableArray<NSString *> * allYears;
@end
