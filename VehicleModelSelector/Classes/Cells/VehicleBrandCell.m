//
//  VehicleBrandCell.m
//  Pods
//
//  Created by lijun mou on 2017/12/14.
//

#import "VehicleBrandCell.h"
#import "QMUILabel.h"
#import "Masonry.h"

@interface VehicleBrandCell()

@property (nonatomic,strong) UIImageView * brandIconView;
@property (nonatomic,copy)  QMUILabel * brandLabel;
@end

@implementation VehicleBrandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _brandIconView = [[UIImageView alloc]init];
    _brandLabel = [[QMUILabel alloc]init];
    _brandLabel.textAlignment = NSTextAlignmentLeft;
    [_brandLabel setTextColor:[UIColor lightGrayColor]];
    [_brandLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
    [self.contentView addSubview:_brandIconView];
    [self.contentView addSubview:_brandLabel];
    [_brandIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.height.equalTo(self.contentView.mas_height).multipliedBy(0.8);
    }];
    [_brandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(_brandIconView.mas_right).offset(10);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(0.8);
        make.right.equalTo(self.contentView.mas_right);
    }];
}
- (void)initCellWithData:(NSDictionary *)data
{
    if (data) {
        
    }
    NSURL * iconUrl = [NSURL URLWithString:data[@"iconUrl"]];
    NSString * brandName = data[@"brand_name"];
    
    _brandLabel.text = brandName;
    
    dispatch_async(dispatch_get_global_queue(0, DISPATCH_QUEUE_PRIORITY_BACKGROUND), ^{
        _brandIconView.image = [UIImage imageNamed:@"default"];
        // 获取网络图片数据
        NSData * brandIconData = [NSData dataWithContentsOfURL:iconUrl];
        UIImage * brandIcon = [UIImage imageWithData:brandIconData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _brandIconView.image = brandIcon;
        });
    });
}
@end
