//
//  Card.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/6/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Card.h"

static NSMutableDictionary *CARD_CACHE;

@implementation Card

+ (void)initialize {
    if (self == [Card class]) {
        CARD_CACHE = [[NSMutableDictionary alloc] init];
    }
}

+ (Card *)cardWithRank:(Rank)rank suit:(Suit)suit {
    NSString *key = [NSString stringWithFormat:@"%i-%i", rank, suit];
    
    if (CARD_CACHE[key] == nil) {
        CARD_CACHE[key] = [[Card alloc] initWithRank:rank suit:suit];
    }
    
    return CARD_CACHE[key];
}

- (id)initWithRank:(Rank)rank suit:(Suit)suit {
    if (self = [super init]) {
        _rank = rank;
        _suit = suit;
    }
    return self;
}

- (NSInteger)ordinalValue {
    return self.rank + 1;
}

- (NSInteger)pipValue {
    if (self.rank < Ten) {
        return self.rank + 1;
    }
    return 10;
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

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"Card - %i of %i", self.rank, self.suit];
}

@end
