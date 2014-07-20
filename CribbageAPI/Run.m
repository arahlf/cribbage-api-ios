//
//  Run.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/15/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Run.h"

@implementation Run

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib {
    NSArray *cards = [hand arrayByAddingObject:cut];
    NSMutableDictionary *groups = [[NSMutableDictionary alloc] init];
    
    // store off all the cards into a groups based on their ordinal
    for (Card *card in cards) {
        NSNumber *ordinal = @(card.ordinalValue);
        
        if (groups[ordinal] == nil) {
            groups[ordinal] = [[NSMutableArray alloc] init];
        }
        
        [groups[ordinal] addObject:card];
    }
    
    NSArray *ordinals = [[groups allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    NSInteger lastOrdinal = [ordinals[0] integerValue];
    NSInteger currentStreak = 1;
    NSInteger longestStreak = 1;
    NSInteger currentStreakStart = lastOrdinal;
    NSInteger longestStreakStart = 0;
    NSInteger ordinalsCount = [ordinals count];
    
    for (NSInteger i = 1; i < ordinalsCount; i++) {
        NSInteger ordinal = [ordinals[i] integerValue];
        
        if (ordinal == lastOrdinal + 1) {
            currentStreak++;
            
            if (i == ordinalsCount - 1 && currentStreak > longestStreak) {
                longestStreak = currentStreak;
                longestStreakStart = currentStreakStart;
            }
        }
        else {
            if (currentStreak > longestStreak) {
                longestStreak = currentStreak;
                longestStreakStart = currentStreakStart;
            }
            
            currentStreak = 1;
            currentStreakStart = ordinal;
        }
        
        lastOrdinal = ordinal;
    }
    
    if (longestStreak < 3) {
        return @[];
    }
    
    NSMutableArray *runCards = [[NSMutableArray alloc] init];
    
    BOOL tripleRun = NO;
    NSInteger doubleRunCount = 0;
    
    for (NSInteger i = longestStreakStart; i < longestStreakStart + longestStreak; i++) {
        NSArray *groupCards = groups[@(i)];
        NSInteger groupCardsCount = [groupCards count];
        
        if (groupCardsCount == 3) {
            tripleRun = YES;
        }
        else if (groupCardsCount == 2) {
            doubleRunCount++;
        }
        
        for (Card *card in groupCards) {
            [runCards addObject:card];
        }
    }
    
    Score *score = nil;
    
    if (longestStreak == 3) {
        if (doubleRunCount == 1) {
            score = [Score scoreWithPoints:6 displayName:@"Double run of three for 6" cards:runCards];
        }
        else if (doubleRunCount == 2) {
            score = [Score scoreWithPoints:12 displayName:@"Double double run of three for 12" cards:runCards];
        }
        else if (tripleRun) {
            score = [Score scoreWithPoints:9 displayName:@"Triple run of three for 9" cards:runCards];
        }
        else {
            score = [Score scoreWithPoints:3 displayName:@"Run of three for 3" cards:runCards];
        }
    }
    else if (longestStreak == 4) {
        if (doubleRunCount == 1) {
            score = [Score scoreWithPoints:8 displayName:@"Double run of four for 8" cards:runCards];
        }
        else {
            score = [Score scoreWithPoints:4 displayName:@"Run of four for 4" cards:runCards];
        }
    }
    else if (longestStreak == 5) {
        score = [Score scoreWithPoints:5 displayName:@"Run of five for 5" cards:runCards];
    }
    
    if (score) {
        return @[score];
    }
    return @[];
}

- (BOOL)isRun:(NSArray *)cards {
    if ([cards count] < 3) {
        return NO;
    }
    
    NSArray *sortedCards = [cards sortedArrayUsingComparator:^NSComparisonResult(Card *a, Card *b) {
        return [@(a.rank) compare:@(b.rank)];
    }];
    
    NSInteger lastOrdinal = [sortedCards[0] ordinalValue];
    
    for (NSInteger i = 1; i < [sortedCards count]; i++) {
        NSInteger currentOrdinal = [sortedCards[i] ordinalValue];
        
        if (currentOrdinal == lastOrdinal + 1) {
            lastOrdinal = currentOrdinal;
        }
        else {
            return NO;
        }
    }
    return YES;
}

@end
