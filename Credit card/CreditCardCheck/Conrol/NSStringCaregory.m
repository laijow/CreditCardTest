//
//  NSStringCaregory.m
//  Credit card
//
//  Created by User on 07.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import "NSStringCaregory.h"

@implementation NSString (CreditCardCheck)

- (NSString *)clearCardString {
    
    NSString* inputString = [[NSString alloc] initWithString:self];
    inputString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return inputString;
    
}

@end
