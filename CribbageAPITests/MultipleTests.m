//
//  MultipleTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/10/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Multiple.h"
#import "Cards.h"
#import "XCTestCase+ScoreAssertions.h"

@interface MultipleTests : XCTestCase
@end

@implementation MultipleTests

- (void)testTwoOfAKind {
    NSArray *hand = @[ACE_OF_DIAMONDS, FOUR_OF_CLUBS, FIVE_OF_SPADES, TEN_OF_HEARTS];
    
    NSArray *scores = [Multiple scoreHand:hand cut:TEN_OF_DIAMONDS crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:2 displayName:@"Pair for 2" cardCount:2];
}

- (void)testThreeOfAKind {
    NSArray *hand = @[ACE_OF_DIAMONDS, FOUR_OF_CLUBS, TEN_OF_SPADES, TEN_OF_HEARTS];
    
    NSArray *scores = [Multiple scoreHand:hand cut:TEN_OF_DIAMONDS crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:6 displayName:@"Three of a kind for 6" cardCount:3];
}

- (void)testFourOfAKind {
    NSArray *hand = @[FOUR_OF_HEARTS, FOUR_OF_DIAMONDS, SEVEN_OF_HEARTS, FOUR_OF_CLUBS];
    
    NSArray *scores = [Multiple scoreHand:hand cut:FOUR_OF_SPADES crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:12 displayName:@"Four of a kind for 12" cardCount:4];
}

- (void)testMultiplePairs {
    NSArray *hand = @[EIGHT_OF_DIAMONDS, EIGHT_OF_SPADES, FIVE_OF_HEARTS, EIGHT_OF_HEARTS];
    
    NSArray *scores = [Multiple scoreHand:hand cut:FIVE_OF_CLUBS crib:NO];
    
    XCTAssertEqual(2, [scores count]);
    [self assertScore:scores[0] points:2 displayName:@"Pair for 2" cardCount:2];
    [self assertScore:scores[1] points:6 displayName:@"Three of a kind for 6" cardCount:3];
}

@end
