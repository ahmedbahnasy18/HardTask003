//
//  ProductsViewController.h
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *BestSellersCollectioView;
@property (strong, nonatomic) IBOutlet UICollectionView *BrandsCollectionView;
@property (strong, nonatomic) NSArray *bestSellersArr;
@property (strong, nonatomic) NSArray *brandsArr;

@end
