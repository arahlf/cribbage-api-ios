//
//  XCTest+ScoreAssertions.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/8/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "XCTestCase+ScoreAssertions.h"

@implementation XCTestCase (ScoreAssertions)

- (void)assertScore:(Score *)score points:(NSInteger)points displayName:(NSString *)displayName cardCount:(NSInteger)cardCount {
    XCTAssertEqual(points, score.points);
    XCTAssertEqualObjects(displayName, score.displayName);
    XCTAssertEqual(cardCount, [score.cards count]);
}

@end
