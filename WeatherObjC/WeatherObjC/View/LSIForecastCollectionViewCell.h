//
//  LSIForecastCollectionViewCell.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIForecastCollectionViewCell : UICollectionViewCell

- (void)updateViews;

@property (nonatomic, strong) LSIForecast *forecast;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

NS_ASSUME_NONNULL_END
