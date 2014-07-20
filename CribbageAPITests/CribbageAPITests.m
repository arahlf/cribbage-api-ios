//
//  CribbageAPITests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/20/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CribbageAPI.h"
#import "Cards.h"
#import "XCTestCase+ScoreAssertions.h"

@interface CribbageAPITests : XCTestCase
@end

@implementation CribbageAPITests

- (void)testPerfectHand {
    NSArray *hand = @[JACK_OF_CLUBS, FIVE_OF_DIAMONDS, FIVE_OF_SPADES, FIVE_OF_HEARTS];
    
    NSArray *scores = [CribbageAPI scoreHand:hand cut:FIVE_OF_CLUBS crib:NO];
    
    XCTAssertEqual(10, [scores count]);
    XCTAssertEqual(29, [Score totalPoints:scores]);
}

@end
