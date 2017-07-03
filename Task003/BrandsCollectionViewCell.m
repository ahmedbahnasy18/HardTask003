//
//  BrandsCollectionViewCell.m
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "BrandsCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation BrandsCollectionViewCell

-(void)setEntity:(Brand *)entity{
    
    [self.brandImage sd_setImageWithURL:[NSURL URLWithString:entity.photo]
                         placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                                  options:SDWebImageRetryFailed];
}

@end
