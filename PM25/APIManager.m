//
//  APIManager.m
//  PM25
//
//  Created by 汪鑫源 on 16/3/26.
//  Copyright © 2016年 汪鑫源. All rights reserved.
//

#import "APIManager.h"

NSString *const PM25IN_KEY = @"5j1znBVAsnSf5xQyNQyq";

@implementation APIManager

+ (instancetype)sharedInstance {
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APIManager alloc] init];
    });
    return sharedInstance;
}

- (void)getPM2_5InArea:(NSString *)area completionHandler:(completionHandler)handler {
}


- (void)getPM2_5InArea:(NSString *)area success:(void (^)(PM25Data *))success failure:(void (^)(NSError *))failure {
    NSString *url = [[NSString stringWithFormat:@"http://www.pm25.in/api/querys/pm2_5.json?city=%@&token=%@&stations=no", area, PM25IN_KEY] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLSessionTask *requestTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error && failure) {
            failure(error);
        } else {
            if (success) {
                NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                success([[PM25Data alloc] initWithJSON:jsonString]);
            }
        }
    }];
    [requestTask resume];
}

@end
