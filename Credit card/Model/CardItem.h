//
//  CardItem.h
//  Credit card
//
//  Created by User on 06.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CardItem : NSObject

@property (strong, nonatomic) NSString * scheme;
@property (strong, nonatomic) NSString * type;
@property (strong, nonatomic) NSString * country;
@property (strong, nonatomic) NSString * bank;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end

