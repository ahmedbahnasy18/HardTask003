//
//  BestSellersCollectionViewCell.h
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BestSeller.h"

@interface BestSellersCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productTitle_lbl;
@property (strong, nonatomic) IBOutlet UILabel *productPrice_lbl;
@property (strong, nonatomic) BestSeller *entity;

@end
