//
//  LSIForecastCollectionViewCell.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIForecastCollectionViewCell.h"
#import "LSIForecast.h"

@implementation LSIForecastCollectionViewCell

- (void)updateViews
{
    if (self.forecast != nil) {
        self.iconImageView.image = self.forecast.image;
        self.temperatureLabel.text = [NSString stringWithFormat:@"%.f", self.forecast.temperature];
    }
}

@end
