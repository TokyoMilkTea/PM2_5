//
//  ViewController.m
//  PM25
//
//  Created by 汪鑫源 on 16/3/24.
//  Copyright © 2016年 汪鑫源. All rights reserved.
//

#import "ViewController.h"
#import "PM25Data.h"

NSString *const PM25IN_KEY = @"5j1znBVAsnSf5xQyNQyq";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"pm2_5" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:nil];
    PM25Data *pmData = [[PM25Data alloc] initWithJSON:jsonString];
    NSLog(@"%@", pmData.description);
}

@end