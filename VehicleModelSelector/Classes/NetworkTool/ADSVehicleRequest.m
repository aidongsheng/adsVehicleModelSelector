//
//  ADSVehicleRequest.m
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import "ADSVehicleRequest.h"


@implementation ADSALLBrandRequest
- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString *)baseUrl
{
    return @"http://192.168.0.62:8001";
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

- (id)jsonValidator
{
    return @{
             @"brand":[NSArray class]
             };
}

- (NSInteger)cacheTimeInSeconds
{
    return 0;
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


@implementation ADSBrandSeriesRequest
- (id)initWithBrand:(NSString *)brand
{
    if (self = [super init]) {
        _brand = brand;
    }
    return self;
}
- (id)jsonValidator
{
    return @{
             @"series":[NSArray class]
             };
}

- (id)requestArgument
{
    return @{
             @"bd":_brand,
             };
}

@end

@implementation ADSSeriesYearsRequest
- (id)initWithBrand:(NSString *)brand series:(NSString *)series
{
    if (self = [super init]) {
        _brand = brand;
        _series = series;
    }
    return self;
}
- (id)jsonValidator
{
    return @{
             @"year":[NSArray class]
             };
}

- (id)requestArgument
{
    return @{
             @"bd":_brand,
             @"se":_series
             };
}

@end

