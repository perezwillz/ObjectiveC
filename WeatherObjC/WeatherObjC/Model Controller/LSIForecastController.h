//
//  LSIForecastController.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIForecastController : NSObject

- (instancetype)init;

- (void)fetchForecastsForZipCode:(int)zipCode completion:(void (^)(NSError *))completion;

@property (nonatomic, copy, readonly) NSArray *forecasts;

@end

NS_ASSUME_NONNULL_END
