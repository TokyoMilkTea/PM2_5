//
//  PM25Data.h
//  PM25
//
//  Created by 汪鑫源 on 16/3/24.
//  Copyright © 2016年 汪鑫源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PM25Data : NSObject

@property (nonatomic, copy) NSString *city;
@property (nonatomic, assign) NSInteger pm25;
@property (nonatomic, copy) NSString *quality;

- (instancetype) initWithJSON: (NSString *)json;

@end
