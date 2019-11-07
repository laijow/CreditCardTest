//
//  CheckButton.m
//  Credit card
//
//  Created by User on 06.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import "CheckButton.h"

#define ENABLE_COLOR [UIColor colorWithRed:255.0 / 255.0 green:103.0 / 255.0 blue:105.0 / 255.0 alpha:1.0]
#define DISABLE_COLOR [UIColor lightGrayColor]

@implementation CheckButton

- (void)disabled:(BOOL)isDisabled {
    
    self.backgroundColor = isDisabled ? DISABLE_COLOR : ENABLE_COLOR;
    self.enabled = !isDisabled;
    
}

@end
