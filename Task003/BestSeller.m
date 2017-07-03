//
//  BestSeller.m
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "BestSeller.h"

@implementation BestSeller

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             @"title" : @"TitleEN",
             @"photo" : @"Photo",
             @"price" : @"Price",
             @"symbol" : @"SymbolEN"
             };
}

+ (NSArray *)deserializeProductFromJSON:(NSArray *)productJSON
{
    NSError *error;
    NSArray *products = [MTLJSONAdapter modelsOfClass:[BestSeller class] fromJSONArray:productJSON error:&error];
    if (error) {
        NSLog(@"Couldn't convert product JSON to product models: %@", error);
        return nil;
    }
    
    return products;
}

@end
