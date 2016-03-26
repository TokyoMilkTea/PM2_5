//
//  ViewController.m
//  PM25
//
//  Created by 汪鑫源 on 16/3/24.
//  Copyright © 2016年 汪鑫源. All rights reserved.
//

#import "ViewController.h"
#import "PM25Data.h"
#import "APIManager.h"
@import Masonry;

@interface ViewController ()

@property (nonatomic, strong) PM25Data *pm2_5Data;
@property (nonatomic, strong) UILabel *areaLabel;
@property (nonatomic, strong) UILabel *pm2_5Label;
@property (nonatomic, strong) UILabel *qualityLabel;

@end

@implementation ViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupUI];
}

- (void)updateViewConstraints {
    [_areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(60);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [_pm2_5Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.areaLabel.mas_bottom).with.offset(40);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [self.qualityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pm2_5Label.mas_bottom).with.offset(40);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [super updateViewConstraints];
}

#pragma mark - private methods
- (void)setupData {
//    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"pm2_5" ofType:@"json"];
//    NSString *jsonString = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
//    self.pm2_5Data = [[PM25Data alloc] initWithJSON:jsonString];
    [[APIManager sharedInstance] getPM2_5InArea:@"西安" success:^(PM25Data *data) {
        NSLog(@"%@", data.description);
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)setupUI {
    [self.view addSubview:self.areaLabel];
    [self.view addSubview:self.pm2_5Label];
    [self.view addSubview:self.qualityLabel];
}

#pragma mark - getter setter
- (UILabel *)areaLabel {
    if (!_areaLabel) {
        _areaLabel = [[UILabel alloc] init];
        _areaLabel.text = [NSString stringWithFormat:@"城市: %@", _pm2_5Data.area];
    }
    return _areaLabel;
}

- (UILabel *)pm2_5Label {
    if (!_pm2_5Label) {
        _pm2_5Label = [[UILabel alloc] init];
        _pm2_5Label.text = [NSString stringWithFormat:@"pm2.5: %ld", (long)_pm2_5Data.pm25];
    }
    return _pm2_5Label;
}

- (UILabel *)qualityLabel {
    if (!_qualityLabel) {
        _qualityLabel = [[UILabel alloc] init];
        _qualityLabel.text = _pm2_5Data.quality;
    }
    return _qualityLabel;
}

@end