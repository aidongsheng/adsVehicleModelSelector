//
//  ADSVehicleRequest.h
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import <YTKNetwork/YTKNetwork.h>
@class ADSBrandSeriesRequest;
@class ADSSeriesYearsRequest;
// 全部品牌接口
@interface ADSALLBrandRequest : YTKRequest{
    NSString * _brand;
    NSString * _series;
    NSString * _year;
}

- (id)init;

@end
// 品牌车型接口
@interface ADSBrandSeriesRequest : ADSALLBrandRequest
- (id)initWithBrand:(NSString *)brand;
@end
// 车型年份接口
@interface ADSSeriesYearsRequest : ADSALLBrandRequest
- (id)initWithBrand:(NSString *)brand series:(NSString *)series;
@end
