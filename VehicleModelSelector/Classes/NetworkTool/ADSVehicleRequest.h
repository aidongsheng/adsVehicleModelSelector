//
//  ADSVehicleRequest.h
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import <YTKNetwork/YTKNetwork.h>

@interface ADSVehicleRequest : YTKRequest

- (id)initWithBrand:(NSString *)brand series:(NSString *)series;

@end
