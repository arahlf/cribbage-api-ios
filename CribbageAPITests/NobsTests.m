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
    Hand *hand = [Hand handWithCards:@[Cards.twoOfClubs, Cards.eightOfSpades, Cards.jackOfDiamonds, Cards.aceOfHearts] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.fourOfDiamonds];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:1 displayName:@"Nobs for 1" cardCount:2];
}

- (void)testNobsInCrib {
    Hand *hand = [Hand handWithCards:@[Cards.twoOfClubs, Cards.eightOfSpades, Cards.jackOfDiamonds, Cards.aceOfHearts] crib:YES];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.fourOfDiamonds];
    
    XCTAssertEqual(1, [scores count]);
    [self assertScore:scores[0] points:1 displayName:@"Nobs for 1" cardCount:2];
}

- (void)testWhenJackIsTheCut {
    Hand *hand = [Hand handWithCards:@[Cards.twoOfClubs, Cards.eightOfSpades, Cards.fourOfDiamonds, Cards.aceOfHearts] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.jackOfDiamonds];
    
    XCTAssertEqual(0, [scores count]);
}

- (void)testAintNothinThere {
    Hand *hand = [Hand handWithCards:@[Cards.twoOfClubs, Cards.fourOfSpades, Cards.nineOfDiamonds, Cards.queenOfClubs] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:Cards.kingOfHearts];
    
    XCTAssertEqual(0, [scores count]);
}

@end
