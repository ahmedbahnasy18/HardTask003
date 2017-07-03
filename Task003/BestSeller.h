//
//  BestSeller.h
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface BestSeller : MTLModel <MTLJSONSerializing>

@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *photo;
@property (nonatomic ,copy) NSString *price;
@property (nonatomic ,copy) NSString *symbol;

+ (NSArray *)deserializeProductFromJSON:(NSArray *)productJSON;

@end
