//
//  CardTests.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Cards.h"

@interface CardTests : XCTestCase
@end

@implementation CardTests

- (void)testOrdinalValue {
    XCTAssertEqual(1, [ACE_OF_CLUBS ordinalValue]);
    XCTAssertEqual(9, [NINE_OF_DIAMONDS ordinalValue]);
    XCTAssertEqual(10, [TEN_OF_DIAMONDS ordinalValue]);
    XCTAssertEqual(11, [JACK_OF_SPADES ordinalValue]);
    XCTAssertEqual(12, [QUEEN_OF_CLUBS ordinalValue]);
    XCTAssertEqual(13, [KING_OF_HEARTS ordinalValue]);
}

- (void)testPipValue {
    XCTAssertEqual(1, [ACE_OF_CLUBS pipValue]);
    XCTAssertEqual(9, [NINE_OF_DIAMONDS pipValue]);
    XCTAssertEqual(10, [TEN_OF_DIAMONDS pipValue]);
    XCTAssertEqual(10, [JACK_OF_SPADES pipValue]);
    XCTAssertEqual(10, [QUEEN_OF_CLUBS pipValue]);
    XCTAssertEqual(10, [KING_OF_HEARTS pipValue]);
}

- (void)testIsEqual {
    Card *a = THREE_OF_HEARTS;
    Card *b = THREE_OF_HEARTS;
    Card *c = JACK_OF_SPADES;
    
    XCTAssertEqualObjects(a, b);
    XCTAssertNotEqualObjects(a, c);
    XCTAssertNotEqualObjects(a, nil);
}

- (void)testHash {
    NSMutableSet *hashes = [[NSMutableSet alloc] init];
    
    for (NSInteger i = 0; i < 13; i++) {
        for (NSInteger j = 0; j < 4; j++) {
            Card *card = [Card cardWithRank:i suit:j];
            
            NSNumber *hash = @([card hash]);
            
            [hashes addObject:hash];
        }
    }
    
    XCTAssertEqual(52, [hashes count]);
}

- (void)testCardConstantsEquality {
    XCTAssertEqualObjects(FIVE_OF_HEARTS, [Card cardWithRank:Five suit:Hearts]);
}

- (void)testDebugDescription {
    XCTAssertEqualObjects(@"<Ace of Spades>", [ACE_OF_SPADES debugDescription]);
    XCTAssertEqualObjects(@"<Eight of Diamonds>", [EIGHT_OF_DIAMONDS debugDescription]);
    XCTAssertEqualObjects(@"<Queen of Hearts>", [QUEEN_OF_HEARTS debugDescription]);
    XCTAssertEqualObjects(@"<Five of Clubs>", [FIVE_OF_CLUBS debugDescription]);
}

@end
