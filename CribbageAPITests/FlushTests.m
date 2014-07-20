//
//  FlushTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/8/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Flush.h"
#import "Cards.h"
#import "XCTestCase+ScoreAssertions.h"

@interface FlushTests : XCTestCase
@end

@implementation FlushTests

- (void)testNoFlush {
    NSArray *hand = @[FIVE_OF_SPADES, SIX_OF_SPADES, SEVEN_OF_SPADES, QUEEN_OF_CLUBS];
    
    NSArray *scores = [Flush scoreHand:hand cut:FOUR_OF_HEARTS crib:NO];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testFourCardFlush {
    NSArray *hand = @[TWO_OF_HEARTS, EIGHT_OF_HEARTS, KING_OF_HEARTS, ACE_OF_HEARTS];
    
    NSArray *scores = [Flush scoreHand:hand cut:NINE_OF_CLUBS crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:4 displayName:@"Flush (4 card) for 4" cardCount:4];
}

- (void)testFourCardFlushInCrib {
    NSArray *hand = @[TWO_OF_HEARTS, EIGHT_OF_HEARTS, KING_OF_HEARTS, ACE_OF_HEARTS];
    
    NSArray *scores = [Flush scoreHand:hand cut:NINE_OF_CLUBS crib:YES];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testFiveCardFlush {
    NSArray *hand = @[FIVE_OF_SPADES, SIX_OF_SPADES, SEVEN_OF_SPADES, QUEEN_OF_SPADES];
    
    NSArray *scores = [Flush scoreHand:hand cut:FOUR_OF_SPADES crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:5 displayName:@"Flush (5 card) for 5" cardCount:5];
}

- (void)testFiveCardFlushInCrib {
    NSArray *hand = @[FIVE_OF_SPADES, SIX_OF_SPADES, SEVEN_OF_SPADES, QUEEN_OF_SPADES];
    
    NSArray *scores = [Flush scoreHand:hand cut:FOUR_OF_SPADES crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:5 displayName:@"Flush (5 card) for 5" cardCount:5];
}

@end
