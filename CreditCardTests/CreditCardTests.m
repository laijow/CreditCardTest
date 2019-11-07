//
//  CreditCardTests.m
//  CreditCardTests
//
//  Created by Антон Нуждин on 07.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CCValid.h"
#import "NSStringCaregory.h"

@interface CreditCardTests : XCTestCase

@property (nonatomic) CCValid * validator;

@end

@implementation CreditCardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _validator = [[CCValid alloc] init];
}

- (void)tearDown {
    [super tearDown];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testCreditCardValidTrue {
    NSString * card1 = @"4556369796416476";
    XCTAssertTrue([_validator creditCardValidWith:card1]);
}

- (void)testCreditCardValidFalse {
    NSString * card1 = @"125222319955223";
    XCTAssertFalse([_validator creditCardValidWith:card1]);
}

- (void)testCreditCardContainsDicimalNumberTrue {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * card1 = @"54213231235633423";
    XCTAssertTrue([card1 containsOnlyDecimalCharacter]);
    
}

- (void)testCreditCardContainsDicimalNumberFalse {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * card1 = @"5413G231S23563D33";
    XCTAssertFalse([card1 containsOnlyDecimalCharacter]);
    
}

- (void)testCreditCardLeadingZeroFalse {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * card1 = @"05413G231S23563D33";
    XCTAssertFalse([card1 containsOnlyDecimalCharacter]);
    
}

- (void)testCreditCardLengthFalse {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * card1 = @"0541321";
    XCTAssertFalse([card1 creditCardLenthCheck]);
    
}

- (void)testCreditCardLengthTrue {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * card1 = @"54213231235633423";
    XCTAssertTrue([card1 creditCardLenthCheck]);
    
}

- (void)testCreditCardLuhnTrue {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * card1 = @"4024007143758919";
    XCTAssertTrue([card1 luhnValidateString]);
    
}

- (void)testCreditCardLuhnfalse {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * card1 = @"54213231235";
    XCTAssertFalse([card1 luhnValidateString]);
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
