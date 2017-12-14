//
//  ADSVehicleModelController.m
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import "ADSVehicleModelController.h"
#import "ADSVehicleRequest.h"
#import "VehicleBrandCell.h"
#import "Masonry.h"
#import "ADSVehicleModel.h"

@interface ADSVehicleModelController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * vehicleTableView;

@end

@implementation ADSVehicleModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dispatch_async(dispatch_get_global_queue(0, DISPATCH_QUEUE_PRIORITY_HIGH), ^{
        [self initData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initSubViews];
        });
    });
}

- (void)initData
{
    ADSALLBrandRequest * brandRequest = [[ADSALLBrandRequest alloc]init];
    [brandRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.responseString);
        
        NSArray * brands = [request.responseJSONObject objectForKey:@"brand"];;
        for (int index = 0; index < brands.count; index++) {
            NSDictionary * brand = brands[index];
            NSString * brandName = brand[@"name"];
            NSString * brandIconUrl = [@"http://192.168.0.62:8001/51auto/autobrand" stringByAppendingString:brand[@"autoflag"]];
            NSDictionary * brandInfo = [NSDictionary dictionaryWithObjectsAndKeys:brandName,@"brand_name",brandIconUrl,@"iconUrl", nil];
            [[VehicleBrand shareInstance].allBrands addObject:brandInfo];
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.error);
    }];
}

- (void)initSubViews
{
    _vehicleTableView = [[UITableView alloc]initWithFrame:CGRectZero
                                                    style:UITableViewStylePlain];
    _vehicleTableView.delegate = self;
    _vehicleTableView.dataSource = self;
    [self.view addSubview:_vehicleTableView];
    [_vehicleTableView registerClass:[VehicleBrandCell class]
              forCellReuseIdentifier:NSStringFromClass([VehicleBrandCell class])];
    [_vehicleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [VehicleBrand shareInstance].allBrands.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VehicleBrandCell * cell = (VehicleBrandCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VehicleBrandCell class])];
    if (!cell) {
        cell = [[VehicleBrandCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:NSStringFromClass([VehicleBrandCell class])];
    }
    [self configCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)configCell:(VehicleBrandCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell initCellWithData:[VehicleBrand shareInstance].allBrands[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
@end
