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
    Hand *hand = [Hand handWithCards:@[Cards.fiveOfSpades, Cards.sixOfSpades, Cards.sevenOfSpades, Cards.queenOfClubs] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.fourOfHearts];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testFourCardFlush {
    Hand *hand = [Hand handWithCards:@[Cards.twoOfHearts, Cards.eightOfHearts, Cards.kingOfHearts, Cards.aceOfHearts] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.nineOfClubs];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:4 displayName:@"Flush (4 card) for 4" cardCount:4];
}

- (void)testFourCardFlushInCrib {
    Hand *hand = [Hand handWithCards:@[Cards.twoOfHearts, Cards.eightOfHearts, Cards.kingOfHearts, Cards.aceOfHearts] crib:YES];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.nineOfClubs];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testFiveCardFlush {
    Hand *hand = [Hand handWithCards:@[Cards.fiveOfSpades, Cards.sixOfSpades, Cards.sevenOfSpades, Cards.queenOfSpades] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.fourOfSpades];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:5 displayName:@"Flush (5 card) for 5" cardCount:5];
}

- (void)testFiveCardFlushInCrib {
    Hand *hand = [Hand handWithCards:@[Cards.fiveOfSpades, Cards.sixOfSpades, Cards.sevenOfSpades, Cards.queenOfSpades] crib:YES];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.fourOfSpades];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:5 displayName:@"Flush (5 card) for 5" cardCount:5];
}

@end
