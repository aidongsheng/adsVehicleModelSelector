//
//  ADSVehicleModelController.m
//  Pods
//
//  Created by lijun mou on 2017/12/13.
//

#import "ADSVehicleModelController.h"
#import "ADSVehicleRequest.h"

@interface ADSVehicleModelController ()

@property (nonatomic,strong) UITableView * vehicleTableView;

@end

@implementation ADSVehicleModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton * button1 = [[UIButton alloc]init];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(requestVehicle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button2 = [[UIButton alloc]init];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(requestVehicle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * button3 = [[UIButton alloc]init];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(requestVehicle:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    CGFloat buttonHeight = 40,buttonPadding = 20;
    
    button1.frame = CGRectMake(10, 100, 100, buttonHeight);
    button2.frame = CGRectMake(10, button1.frame.origin.y+buttonHeight+buttonPadding, 100, buttonHeight);
    button3.frame = CGRectMake(10, button2.frame.origin.y+buttonHeight+buttonPadding, 100, buttonHeight);
    
    [button1 setTitle:@"所有品牌" forState:UIControlStateNormal];
    [button2 setTitle:@"品牌系列" forState:UIControlStateNormal];
    [button3 setTitle:@"系列年份" forState:UIControlStateNormal];
}

- (void)initSubViews
{
    _vehicleTableView = [[UITableView alloc]initWithFrame:CGRectZero
                                                    style:UITableViewStyleGrouped];
    
}

- (void)requestVehicle:(UIButton *)sendor
{
        if (sendor.tag == 1) {
            ADSALLBrandRequest * request = [[ADSALLBrandRequest alloc]init];
            [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"response:%@",request.responseString);
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"error:%@",request.error);
            }];
        }else if (sendor.tag == 2){
            NSString * brand = @"大众";
            ADSBrandSeriesRequest * request = [[ADSBrandSeriesRequest alloc]initWithBrand:brand];
            [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"response:%@",request.responseString);
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"error:%@",request.error);
            }];
        }else if (sendor.tag == 3){
            NSString * brand = @"大众";
            NSString * series = @"速腾";
            
            ADSSeriesYearsRequest * request = [[ADSSeriesYearsRequest alloc]initWithBrand:brand
                                                                                   series:series];
            [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"response:%@",request.responseString);
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"error:%@",request.error);
            }];
        }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
}
@end
