//
//  BrandsCollectionViewCell.h
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brand.h"

@interface BrandsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *brandImage;
@property (strong, nonatomic) Brand *entity;

@end
