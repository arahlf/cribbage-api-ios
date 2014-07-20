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
    NSString *key = [NSString stringWithFormat:@"%ld-%ld", (long)rank, (long)suit];
    
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
    return (_rank * 4) + _suit;
}

- (NSString *)description {
    static NSArray *rankNames = nil;
    static NSArray *suitNames = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        rankNames = @[@"Ace", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Jack", @"Queen", @"King"];
        suitNames = @[@"Clubs", @"Diamonds", @"Hearts", @"Spades"];
    });
    
    return [NSString stringWithFormat:@"<%@ of %@>", rankNames[self.rank], suitNames[self.suit]];
}

@end
