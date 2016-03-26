//
//  APIManager.h
//  PM25
//
//  Created by 汪鑫源 on 16/3/26.
//  Copyright © 2016年 汪鑫源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PM25Data.h"

@interface APIManager : NSObject

typedef void (^completionHandler)(NSData *data, NSURLResponse *response, NSError *error);

+ (instancetype)sharedInstance;
/**
 *  请求城市pm2.5
 *
 *  @param area    城市名称
 *  @param success 请求成功
 *  @param failure 请求失败
 */
- (void)getPM2_5InArea:(NSString *)area success:(void (^)(PM25Data *data))success failure:(void (^)(NSError *error))failure;

@end
