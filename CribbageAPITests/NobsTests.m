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
@end

@implementation NobsTests

- (void)testNobs {
    NSArray *hand = @[TWO_OF_CLUBS, EIGHT_OF_SPADES, JACK_OF_DIAMONDS, ACE_OF_HEARTS];
    
    NSArray *scores = [Nobs scoreHand:hand cut:FOUR_OF_DIAMONDS crib:NO];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:1 displayName:@"Nobs for 1" cardCount:2];
}

- (void)testNobsInCrib {
    NSArray *hand = @[TWO_OF_CLUBS, EIGHT_OF_SPADES, JACK_OF_DIAMONDS, ACE_OF_HEARTS];
    
    NSArray *scores = [Nobs scoreHand:hand cut:FOUR_OF_DIAMONDS crib:YES];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:1 displayName:@"Nobs for 1" cardCount:2];
}

- (void)testWhenJackIsTheCut {
    NSArray *hand = @[TWO_OF_CLUBS, EIGHT_OF_SPADES, FOUR_OF_DIAMONDS, ACE_OF_HEARTS];
    
    NSArray *scores = [Nobs scoreHand:hand cut:JACK_OF_DIAMONDS crib:NO];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testAintNothinThere {
    NSArray *hand = @[TWO_OF_CLUBS, FOUR_OF_SPADES, NINE_OF_DIAMONDS, QUEEN_OF_CLUBS];
    
    NSArray *scores = [Nobs scoreHand:hand cut:KING_OF_HEARTS crib:NO];
    
    XCTAssertEqual(0, [scores count]);
}

@end
