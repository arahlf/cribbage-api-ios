//
//  CountTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/10/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FifteenCount.h"
#import "Cards.h"
#import "XCTestCase+ScoreAssertions.h"

@interface FifteenCountTests : XCTestCase
@end

@implementation FifteenCountTests

- (void)testNoFifteens {
    NSArray *hand = @[SEVEN_OF_SPADES, NINE_OF_DIAMONDS, JACK_OF_CLUBS, KING_OF_SPADES];

    NSArray *scores = [FifteenCount scoreHand:hand cut:ACE_OF_CLUBS crib:NO];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testSingleFifteen {
    NSArray *hand = @[SEVEN_OF_HEARTS, NINE_OF_DIAMONDS, JACK_OF_CLUBS, KING_OF_SPADES];
    
    NSArray *scores = [FifteenCount scoreHand:hand cut:EIGHT_OF_DIAMONDS crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:2 displayName:@"Fifteen for 2" cardCount:2];
}

- (void)testTwoFifteens {
    NSArray *hand = @[SEVEN_OF_HEARTS, EIGHT_OF_HEARTS, JACK_OF_CLUBS, KING_OF_SPADES];
    
    NSArray *scores = [FifteenCount scoreHand:hand cut:EIGHT_OF_DIAMONDS crib:NO];
    
    XCTAssertEqual(2, [scores count]);
    [self assertScore:scores[0] points:2 displayName:@"Fifteen for 2" cardCount:2];
    [self assertScore:scores[1] points:2 displayName:@"Fifteen for 2" cardCount:2];
}

- (void)testThreeFives {
    NSArray *hand = @[FIVE_OF_DIAMONDS, FIVE_OF_SPADES, EIGHT_OF_DIAMONDS, THREE_OF_CLUBS];
    
    NSArray *scores = [FifteenCount scoreHand:hand cut:FIVE_OF_HEARTS crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:2 displayName:@"Fifteen for 2" cardCount:3];
}

- (void)testFourFives {
    NSArray *hand = @[FIVE_OF_DIAMONDS, FIVE_OF_SPADES, FIVE_OF_CLUBS, THREE_OF_CLUBS];
    
    NSArray *scores = [FifteenCount scoreHand:hand cut:FIVE_OF_HEARTS crib:NO];
    
    XCTAssertEqual(4, [scores count]);
}

- (void)testPerfectHand {
    NSArray *hand = @[FIVE_OF_DIAMONDS, FIVE_OF_SPADES, FIVE_OF_CLUBS, JACK_OF_HEARTS];
    
    NSArray *scores = [FifteenCount scoreHand:hand cut:FIVE_OF_HEARTS crib:NO];
    
    XCTAssertEqual(8, [scores count]);
}

@end
