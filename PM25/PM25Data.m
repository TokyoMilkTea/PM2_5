//
//  PM25Data.m
//  PM25
//
//  Created by 汪鑫源 on 16/3/24.
//  Copyright © 2016年 汪鑫源. All rights reserved.
//

#import "PM25Data.h"

@implementation PM25Data

- (instancetype)initWithJSON:(NSString *)json {
    self = [super init];
    if (self) {
        NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if ([json isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic in json) {
                self.area = dic[@"area"];
                self.pm25 = [(NSString *)dic[@"pm2_5"] integerValue];
                self.quality = dic[@"quality"];
            }
        } else {
            for (NSString *key in json) {
                NSLog(@"%@ : %@", key, [json objectForKey:key]);
            }
        }
    }
    return self;
}

- (NSString *)description {
    NSString *area = self.area;
    NSString *pm25 = [NSString stringWithFormat:@"%ld", (long)self.pm25];
    NSString *quality = self.quality;
    return [NSString stringWithFormat:@"城市: %@, pm2.5: %@, 空气质量: %@", area, pm25, quality];
}
@end
