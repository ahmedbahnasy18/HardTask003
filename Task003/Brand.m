//
//  Brand.m
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "Brand.h"

@implementation Brand

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"photo" : @"Photo"
             };
}

+ (NSArray *)deserializeBrandFromJSON:(NSArray *)productJSON
{

    NSError *error;
    NSArray *products = [MTLJSONAdapter modelsOfClass:[Brand class] fromJSONArray:productJSON error:&error];
    if (error) {
        NSLog(@"Couldn't convert Brand JSON to Brand models: %@", error);
        return nil;
    }
    
    return products;
}

@end
