//
//  BestSellersCollectionViewCell.m
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "BestSellersCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation BestSellersCollectionViewCell

-(void)setEntity:(BestSeller *)entity{
    
    self.productTitle_lbl.text = entity.title;
    self.productPrice_lbl.text = [NSString stringWithFormat:@"%@ %@", entity.price, entity.symbol];
    [self.productImage sd_setImageWithURL:[NSURL URLWithString:entity.photo]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                                      options:SDWebImageRetryFailed];
}
@end
