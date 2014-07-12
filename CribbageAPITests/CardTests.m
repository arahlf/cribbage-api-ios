//
//  CardTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Card.h"

@interface CardTests : XCTestCase
@end

@implementation CardTests

- (void)testIsEqual {
    Card *a = [Card cardWithRank:Three suit:Hearts];
    Card *b = [Card cardWithRank:Three suit:Hearts];
    Card *c = [Card cardWithRank:Jack suit:Spades];
    
    XCTAssertEqualObjects(a, b);
    XCTAssertNotEqualObjects(a, c);
    XCTAssertNotEqualObjects(a, nil);
}

- (void)testHash {
    Card *a = [Card cardWithRank:Five suit:Diamonds];
    Card *b = [Card cardWithRank:Five suit:Diamonds];
    Card *c = [Card cardWithRank:Six suit:Diamonds];
    
    XCTAssertEqual([a hash], [b hash]);
    XCTAssertNotEqual([a hash], [c hash]);
}

@end
