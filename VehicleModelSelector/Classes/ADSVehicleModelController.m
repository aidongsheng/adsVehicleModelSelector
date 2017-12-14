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
#import "YYKit.h"

@interface ADSVehicleModelController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * vehicleTableView;

@end

static NSString * const cellReuseID = @"cell";

@implementation ADSVehicleModelController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
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
        NSDictionary * brandsInfo = [self parseJSONStringToNSDictionary:request.responseString];
        NSArray * brands = brandsInfo[@"brand"];
        for (int index = 0; index < brands.count; index++) {
            NSDictionary * brand = brands[index];
            NSString * brandName = brand[@"name"];
            NSString * brandIconUrl = [@"http://192.168.0.62:8001/51auto/autobrand" stringByAppendingString:brand[@"autoflag"]];
            NSDictionary * brandInfo = [NSDictionary dictionaryWithObjectsAndKeys:brandName,@"brand_name",brandIconUrl,@"iconUrl", nil];
            [[VehicleBrand shareInstance].allBrands addObject:brandInfo];
        }
        [_vehicleTableView reloadData];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.error);
    }];
}

-(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}

- (void)initSubViews
{
    _vehicleTableView = [[UITableView alloc]initWithFrame:CGRectZero
                                                    style:UITableViewStylePlain];
    _vehicleTableView.delegate = self;
    _vehicleTableView.dataSource = self;
    [self.view addSubview:_vehicleTableView];
    [_vehicleTableView registerClass:[VehicleBrandCell class]
              forCellReuseIdentifier:cellReuseID];
    [_vehicleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(self.view.mas_top);
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
    VehicleBrandCell * cell = (VehicleBrandCell *)[tableView dequeueReusableCellWithIdentifier:cellReuseID];
    if (!cell) {
        cell = [[VehicleBrandCell alloc]initWithStyle:UITableViewCellStyleValue1
                                     reuseIdentifier:cellReuseID];
    }
    [cell initCellWithData:[VehicleBrand shareInstance].allBrands[indexPath.row]];
    return cell;
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
