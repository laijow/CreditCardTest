//
//  CCValid.h
//  Credit card
//
//  Created by User on 07.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCValid : NSObject

/**
 Сredit card verification check:
 - Contains only numbers and no leading 0
 - 12-19 digits long
 - Passes the Luhn check
*/
- (BOOL)creditCardValidWith:(NSString*)cardNumberString;

@end

