//
//  LSIForecastSearchViewController.h
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIForecastController;

NS_ASSUME_NONNULL_BEGIN

@interface LSIForecastSearchViewController : UIViewController <UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, copy, readonly) LSIForecastController *forecastController;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
