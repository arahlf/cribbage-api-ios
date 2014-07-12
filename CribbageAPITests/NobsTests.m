//
//  NobsTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/10/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Nobs.h"
#import "Cards.h"
#import "XCTestCase+ScoreAssertions.h"

@interface NobsTests : XCTestCase

@property (nonatomic, strong) id<ScoringRule> rule;

@end

@implementation NobsTests

- (void)setUp {
    [super setUp];
    
    self.rule = [[Nobs alloc] init];
}

- (void)testNobs {
    Hand *hand = [Hand handWithCards:@[TWO_OF_CLUBS, EIGHT_OF_SPADES, JACK_OF_DIAMONDS, ACE_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:FOUR_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:1 displayName:@"Nobs for 1" cardCount:2];
}

- (void)testNobsInCrib {
    Hand *hand = [Hand handWithCards:@[TWO_OF_CLUBS, EIGHT_OF_SPADES, JACK_OF_DIAMONDS, ACE_OF_HEARTS] crib:YES];
    
    NSArray *scores = [self.rule scoreHand:hand cut:FOUR_OF_DIAMONDS];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:1 displayName:@"Nobs for 1" cardCount:2];
}

- (void)testWhenJackIsTheCut {
    Hand *hand = [Hand handWithCards:@[TWO_OF_CLUBS, EIGHT_OF_SPADES, FOUR_OF_DIAMONDS, ACE_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:JACK_OF_DIAMONDS];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testAintNothinThere {
    Hand *hand = [Hand handWithCards:@[TWO_OF_CLUBS, FOUR_OF_SPADES, NINE_OF_DIAMONDS, QUEEN_OF_CLUBS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:KING_OF_HEARTS];
    
    XCTAssertEqual(0, [scores count]);
}

@end
