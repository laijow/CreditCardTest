//
//  ServerManager.m
//  Credit card
//
//  Created by User on 07.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import "ServerManager.h"

@interface ServerManager()

@property (strong, nonatomic) NSURLSession * session;

@end

@implementation ServerManager

+ (ServerManager *)sharedManager {
    
    static ServerManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
    
}

- (void)getCardInfoWithCardNumber:(NSString*)cardNumber
                        onSuccess:(void(^)(CardItem * card)) success
                        onFailure:(void(^)(NSError * error)) failure {
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",apiUrlBase, cardNumber]];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];

    [urlRequest setHTTPMethod:@"GET"];

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData     *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200) {
          NSError *parseError = nil;
          NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0   error:&parseError];
          NSLog(@"The response is - %@",responseDictionary);
            if(responseDictionary != nil) {
                CardItem * item = [[CardItem alloc] initWithDictionary:responseDictionary];
                success(item);
            }
        } else {
            NSLog(@"Error");
            failure(error);
        }
    }];
    [dataTask resume];
    
}

@end
