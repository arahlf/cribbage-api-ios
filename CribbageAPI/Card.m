//
//  Card.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/6/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithRank:(Rank)rank suit:(Suit)suit {
    if (self = [super init]) {
        _rank = rank;
        _suit = suit;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[Card class]]) {
        return NO;
    }
    
    Card *card = (Card *)object;
    
    return _rank == card.rank && _suit == card.suit;
}

- (NSUInteger)hash {
    int result = 17;
    result = 31 * result + _rank;
    result = 31 * result + _suit;
    
    return result;
}

@end
