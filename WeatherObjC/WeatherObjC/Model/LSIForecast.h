//
//  LSIForecast.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIForecast : NSObject

- (instancetype)initWithName:(NSString *)name temperature:(double)temperature iconName:(NSString *)iconName;

- (instancetype)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) double temperature;
@property (nonatomic, copy, readonly) UIImage *image;

@end

NS_ASSUME_NONNULL_END
