//
//  CardItem.m
//  Credit card
//
//  Created by User on 06.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import "CardItem.h"

@implementation CardItem

- (instancetype)initWithDictionary:(NSDictionary*)dict {
    
    self = [super init];
    
    if(self != nil) {
        _scheme = dict[@"scheme"];
        _type = dict[@"type"];
        _bank = [self getBankNameWithDictionary:dict[@"bank"]];
        _country = [self getCountryDescriptionWithDictionary:dict[@"country"]];
    }
    
    return self;
    
}

- (NSString*)getBankNameWithDictionary:(NSDictionary*)dict {
    
    NSString * bankName = dict[@"name"];
    return bankName;
    
}

- (NSString *)getCountryDescriptionWithDictionary:(NSDictionary*)dict {
    
    NSString * emoji = dict[@"emoji"];
    NSString * name = dict[@"name"];
    NSString * countryDescription = emoji != nil ? [NSString stringWithFormat:@"%@%@", emoji, name] : name;
    
    return countryDescription;
    
}

@end
