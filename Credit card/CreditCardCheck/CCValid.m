//
//  CCValid.m
//  Credit card
//
//  Created by User on 07.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import "CCValid.h"
#import "NSStringCaregory.h"

@implementation CCValid

- (BOOL)creditCardValidWith:(NSString *)cardNumberString {
    
    return [cardNumberString containsOnlyDecimalCharacter] && [cardNumberString creditCardLenthCheck] && [cardNumberString luhnValidateString] ? true : false;
    
}

@end
