//
//  LSIForecastController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIForecastController.h"
#import "LSIForecast.h"

@interface LSIForecastController ()

@property (nonatomic, copy) NSMutableArray *internalForecasts;

@end

@implementation LSIForecastController

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _internalForecasts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchForecastsForZipCode:(int)zipCode completion:(void (^)(NSError *))completion;
{
    NSString *zipCodeString = [NSString stringWithFormat:@"%d", zipCode];
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *zipCodeItem = [[NSURLQueryItem alloc] initWithName:@"zip" value: zipCodeString];
    NSURLQueryItem *appIDItem = [[NSURLQueryItem alloc] initWithName:@"appid" value:apiKey];
    NSURLQueryItem *unitsItem = [[NSURLQueryItem alloc] initWithName:@"units" value:@"imperial"];
    
    components.queryItems = @[zipCodeItem,
                              appIDItem,
                              unitsItem];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: components.URL];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching forecasts at %d: %@.", zipCode, error);
            completion(error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned from data task");
            completion([[NSError alloc] init]);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error deserializing JSON: %@", error);
            completion(error);
            return;
        }
        
        NSMutableArray *forecasts = [[NSMutableArray alloc] init];
        
        NSDictionary *cityDictionary = dictionary[@"city"];
        NSString *cityName = cityDictionary[@"name"];
        
        NSArray *listDictionaries = dictionary[@"list"];
        
        for (int i = 0; i < listDictionaries.count; i++) {
            
            NSDictionary *forecastDictionary = listDictionaries[i];
            
            LSIForecast *forecast = [[LSIForecast alloc] initWithName:cityName dictionary:forecastDictionary];
            
            [forecasts addObject:forecast];
        }
        
        self.internalForecasts = forecasts;
        completion(nil);
    }];
    
    [dataTask resume];
    
}

- (NSArray *)forecasts
{
    return self.internalForecasts;
}

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast/daily";
static NSString * const apiKey = @"1340d66bb372ff93adebd79d41eea048";

@end
