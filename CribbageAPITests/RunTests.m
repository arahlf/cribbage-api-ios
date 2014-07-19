//
//  RunTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/15/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Run.h"
#import "Cards.h"
#import "XCTestCase+ScoreAssertions.h"

@interface RunTests : XCTestCase

@property (nonatomic, strong) id<ScoringRule> rule;

@end

@implementation RunTests

- (void)setUp {
    [super setUp];
    
    self.rule = [[Run alloc] init];
}

- (void)testNoRun {
    Hand *hand = [Hand handWithCards:@[FOUR_OF_CLUBS, SIX_OF_SPADES, TEN_OF_DIAMONDS, KING_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:TWO_OF_DIAMONDS];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testTwoCardRun {
    Hand *hand = [Hand handWithCards:@[THREE_OF_SPADES, EIGHT_OF_DIAMONDS, JACK_OF_HEARTS, KING_OF_CLUBS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:TWO_OF_DIAMONDS];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testThreeCardRun {
    Hand *hand = [Hand handWithCards:@[THREE_OF_SPADES, FOUR_OF_CLUBS, SIX_OF_HEARTS, TEN_OF_DIAMONDS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:TWO_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:3 displayName:@"Run of three for 3" cardCount:3];
}

- (void)testFourCardRun {
    Hand *hand = [Hand handWithCards:@[THREE_OF_SPADES, FOUR_OF_CLUBS, FIVE_OF_HEARTS, TEN_OF_DIAMONDS] crib: NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:TWO_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:4 displayName:@"Run of four for 4" cardCount:4];
}

- (void)testFiveCardRun {
    Hand *hand = [Hand handWithCards:@[THREE_OF_SPADES, FOUR_OF_CLUBS, FIVE_OF_DIAMONDS, SIX_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:TWO_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:5 displayName:@"Run of five for 5" cardCount:5];
}

- (void)testDoubleRunThreeCard {
    Hand *hand = [Hand handWithCards:@[FOUR_OF_SPADES, FIVE_OF_DIAMONDS, FIVE_OF_CLUBS, SIX_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:TWO_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:6 displayName:@"Double run of three for 6" cardCount:4];
}

- (void)testDoubleRunFourCard {
    Hand *hand = [Hand handWithCards:@[FOUR_OF_SPADES, FIVE_OF_DIAMONDS, FIVE_OF_CLUBS, SIX_OF_HEARTS] crib: NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:THREE_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:8 displayName:@"Double run of four for 8" cardCount:5];
}

- (void)testDoubleDoubleRun {
    Hand *hand = [Hand handWithCards:@[FOUR_OF_SPADES, FIVE_OF_DIAMONDS, FIVE_OF_CLUBS, SIX_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:FOUR_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:12 displayName:@"Double double run of three for 12" cardCount:5];
}

- (void)testTripleRun {
    Hand *hand = [Hand handWithCards:@[JACK_OF_SPADES, JACK_OF_HEARTS, JACK_OF_CLUBS, QUEEN_OF_DIAMONDS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:TEN_OF_HEARTS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:9 displayName:@"Triple run of three for 9" cardCount:5];
}

@end
