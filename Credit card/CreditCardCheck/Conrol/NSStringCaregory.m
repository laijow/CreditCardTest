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

- (NSString *) formattedStringForProcessing {
    
    NSCharacterSet *illegalCharacters = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [self componentsSeparatedByCharactersInSet:illegalCharacters];
    
    return [components componentsJoinedByString:@""];
    
}

- (BOOL)containsOnlyDecimalCharacter {
    
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([self rangeOfCharacterFromSet:notDigits].location == NSNotFound) {
        NSRange range = [self rangeOfString:@"^0*" options:NSRegularExpressionSearch];
        return range.length != 0 ? false : true;
    }
    return false;
    
}

- (BOOL)creditCardLenthCheck {
    
    if (self.length >= 12 && self.length <= 19) {
        return true;
    }
    
    return false;
    
}

- (BOOL)luhnValidateString {
    
    NSString *formattedString = [self formattedStringForProcessing];
    if (formattedString == nil || formattedString.length < 12) {
        return false;
    }
    
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[formattedString length]];
    
    [formattedString enumerateSubstringsInRange:NSMakeRange(0, [formattedString length]) options:(NSStringEnumerationReverse |NSStringEnumerationByComposedCharacterSequences) usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reversedString appendString:substring];
    }];
    
    NSUInteger oddSum = 0, evenSum = 0;
    
    for (NSUInteger i = 0; i < [reversedString length]; i++) {
        NSInteger digit = [[NSString stringWithFormat:@"%C", [reversedString characterAtIndex:i]] integerValue];
        
        if (i % 2 == 0) {
            evenSum += digit;
        }
        else {
            oddSum += digit / 5 + (2 * digit) % 10;
        }
    }
    return (oddSum + evenSum) % 10 == 0;
    
}

@end
