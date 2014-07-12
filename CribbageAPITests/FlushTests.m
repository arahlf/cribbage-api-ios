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

@property (nonatomic, strong) id<ScoringRule> rule;

@end

@implementation FlushTests

- (void)setUp {
    [super setUp];
    
    self.rule = [[Flush alloc] init];
}

- (void)testNoFlush {
    Hand *hand = [Hand handWithCards:@[FIVE_OF_SPADES, SIX_OF_SPADES, SEVEN_OF_SPADES, QUEEN_OF_CLUBS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:FOUR_OF_HEARTS];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testFourCardFlush {
    Hand *hand = [Hand handWithCards:@[TWO_OF_HEARTS, EIGHT_OF_HEARTS, KING_OF_HEARTS, ACE_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:NINE_OF_CLUBS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:4 displayName:@"Flush (4 card) for 4" cardCount:4];
}

- (void)testFourCardFlushInCrib {
    Hand *hand = [Hand handWithCards:@[TWO_OF_HEARTS, EIGHT_OF_HEARTS, KING_OF_HEARTS, ACE_OF_HEARTS] crib:YES];
    
    NSArray *scores = [self.rule scoreHand:hand cut:NINE_OF_CLUBS];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testFiveCardFlush {
    Hand *hand = [Hand handWithCards:@[FIVE_OF_SPADES, SIX_OF_SPADES, SEVEN_OF_SPADES, QUEEN_OF_SPADES] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:FOUR_OF_SPADES];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:5 displayName:@"Flush (5 card) for 5" cardCount:5];
}

- (void)testFiveCardFlushInCrib {
    Hand *hand = [Hand handWithCards:@[FIVE_OF_SPADES, SIX_OF_SPADES, SEVEN_OF_SPADES, QUEEN_OF_SPADES] crib:YES];
    
    NSArray *scores = [self.rule scoreHand:hand cut:FOUR_OF_SPADES];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:5 displayName:@"Flush (5 card) for 5" cardCount:5];
}

@end
