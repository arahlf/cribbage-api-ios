//
//  CribbageScoringRulesTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/19/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CribbageScoringRules.h"
#import "Cards.h"
#import "XCTestCase+ScoreAssertions.h"

@interface CribbageScoringRulesTests : XCTestCase

@property (nonatomic, strong) id<ScoringRule> rule;

@end

@implementation CribbageScoringRulesTests

- (void)setUp {
    [super setUp];
    
    self.rule = [[CribbageScoringRules alloc] init];
}

- (void)testPerfectHand {
    Hand *hand = [Hand handWithCards:@[JACK_OF_CLUBS, FIVE_OF_DIAMONDS, FIVE_OF_SPADES, FIVE_OF_HEARTS] crib:NO];
    
    NSArray *scores = [self.rule scoreHand:hand cut:FIVE_OF_CLUBS];
    
    XCTAssertEqual(10, [scores count]);
    XCTAssertEqual(29, [Score totalPoints:scores]);
}

@end
