//
//  LSIForecastSearchViewController.m
//  WeatherObjC
//
//  Created by Spencer Curtis on 10/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIForecastSearchViewController.h"
#import "LSIForecastCollectionViewCell.h"
#import "LSIForecastController.h"

@interface LSIForecastSearchViewController ()

@end

@implementation LSIForecastSearchViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _forecastController = [[LSIForecastController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _forecastController = [[LSIForecastController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    int zipCode = [searchBar.text intValue];
    
    if (zipCode) {
        [self.forecastController fetchForecastsForZipCode:zipCode completion:^(NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.forecastController.forecasts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSIForecastCollectionViewCell *cell = (LSIForecastCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ForecastCell" forIndexPath:indexPath];
    
    cell.forecast = self.forecastController.forecasts[indexPath.row];
    
    [cell updateViews];
    
    return cell;
}

@end
