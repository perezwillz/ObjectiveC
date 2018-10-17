//
//  LSIForecast.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIForecast.h"

@implementation LSIForecast

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature iconName:(NSString *)iconName {
    self = [super init];
    if (self) {
        _name = [name copy];
        _temperature = temperature;
        _image = [UIImage imageNamed:iconName];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary
{
    NSDictionary *tempDictionary = dictionary[@"temp"];
    double temperature = [tempDictionary[@"day"] doubleValue];
    
    NSArray *weatherDictionaries = dictionary[@"weather"];
    NSDictionary *weatherDictionary = [weatherDictionaries firstObject];
    NSString *iconName = weatherDictionary[@"icon"];
    return [self initWithName:name temperature:temperature iconName:iconName];
}

@end
