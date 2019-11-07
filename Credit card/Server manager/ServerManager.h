//
//  ServerManager.h
//  Credit card
//
//  Created by User on 07.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import "Settings.h"

@interface ServerManager : NSObject

+ (ServerManager*)sharedManager;

- (void)getCardInfoWithCardNumber:(NSString*)cardNumber
                        onSuccess:(void(^)(CardItem * card)) success
                        onFailure:(void(^)(NSError * error)) failure;

@end

