//
//  ADSVehicleRequest.m
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import "ADSVehicleRequest.h"
#import <YTKNetwork/YTKNetworkConfig.h>

@implementation ADSVehicleRequest{
    NSString * _brand;
    NSString * _series;
    NSString * _year;
}

- (id)initWithBrand:(NSString *)brand series:(NSString *)series{
    self = [super init];
    if(self){
        _brand = brand;
        _series = series;
    }
    return self;
}

- (NSString *)baseUrl
{
    return @"http://api.bsz.zj.cn";
}

- (NSString *)requestUrl
{
    return @"/51auto/autobrand";
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

//- (id)jsonValidator
//{
//    return @{
//             @"year":[NSArray class]
//             };
//}


- (id)requestArgument
{
    return @{
             @"bd":_brand,
             @"se":_series
             };
}
- (NSInteger)cacheTimeInSeconds
{
    return 3;
}

- (BOOL)useCDN
{
    return NO;
}

- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary
{
    
    return @{
             @"Content-Type":@"text/plain;charset=utf8"
             };
}
@end
