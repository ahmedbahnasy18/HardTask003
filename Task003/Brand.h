//
//  Brand.h
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface Brand : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *photo;

+ (NSArray *)deserializeBrandFromJSON:(NSArray *)productJSON;

@end
