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

@property (nonatomic, strong) id<ScoringRule> rule;

@end

@implementation MultipleTests

- (void)setUp {
    [super setUp];
    
    self.rule = [[Multiple alloc] init];
}

- (void)testTwoOfAKind {
    Hand *hand = [Hand handWithCards:@[Cards.aceOfDiamonds, Cards.fourOfClubs, Cards.fiveOfSpades, Cards.tenOfHearts] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.tenOfDiamonds];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:2 displayName:@"Pair for 2" cardCount:2];
}

- (void)testThreeOfAKind {
    Hand *hand = [Hand handWithCards:@[Cards.aceOfDiamonds, Cards.fourOfClubs, Cards.tenOfSpades, Cards.tenOfHearts] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.tenOfDiamonds];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:6 displayName:@"Three of a kind for 6" cardCount:3];
}

- (void)testFourOfAKind {
    Hand *hand = [Hand handWithCards:@[Cards.fourOfHearts, Cards.fourOfDiamonds, Cards.sevenOfHearts, Cards.fourOfClubs] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.fourOfSpades];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:12 displayName:@"Four of a kind for 12" cardCount:4];
}

- (void)testMultiplePairs {
    Hand *hand = [Hand handWithCards:@[Cards.eightOfDiamonds, Cards.eightOfSpades, Cards.fiveOfHearts, Cards.eightOfHearts] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.fiveOfClubs];
    
    XCTAssertEqual(2, [scores count]);
    [self assertScore:scores[0] points:2 displayName:@"Pair for 2" cardCount:2];
    [self assertScore:scores[1] points:6 displayName:@"Three of a kind for 6" cardCount:3];
}

@end
