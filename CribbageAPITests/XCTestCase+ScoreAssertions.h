//
//  XCTest+ScoreAssertions.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/8/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Score.h"

@interface XCTestCase (ScoreAssertions)

- (void)assertScore:(Score *)score points:(NSInteger)points displayName:(NSString *)displayName cardCount:(NSInteger)cardCount;

@end
