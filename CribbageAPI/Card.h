//
//  Card.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/6/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Rank.h"
#import "Suit.h"

@interface Card : NSObject<NSCoding, NSCopying>

@property (readonly, nonatomic) Rank rank;
@property (readonly, nonatomic) Suit suit;

+ (Card *)cardWithRank:(Rank)rank suit:(Suit)suit;

- (NSInteger)ordinalValue;
- (NSInteger)pipValue;

@end
