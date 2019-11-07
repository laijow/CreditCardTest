//
//  NSStringCaregory.h
//  Credit card
//
//  Created by User on 07.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (CreditCardCheck)

- (NSString*)clearCardString;

- (BOOL)containsOnlyDecimalCharacter;

- (BOOL)creditCardLenthCheck;

- (BOOL)luhnValidateString;

@end

