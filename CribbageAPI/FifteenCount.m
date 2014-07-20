//
//  Count.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/10/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "FifteenCount.h"

@implementation FifteenCount

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib {
    NSArray *remainingCards = [hand arrayByAddingObject:cut];
    NSMutableArray *scores = [[NSMutableArray alloc] init];
    
    [self searchForFifteenCounts:@[] remainingCards:remainingCards scores:scores];
    
    return scores;
}

+ (void)searchForFifteenCounts:(NSArray *)currentCards remainingCards:(NSArray *)remainingCards scores:(NSMutableArray *)scores {
    if ([self addCards:currentCards] == 15) {
        [scores addObject:[Score scoreWithPoints:2 displayName:@"Fifteen for 2" cards:currentCards]];
    }
    
    for (NSInteger i = 0; i < [remainingCards count]; i++) {
        NSMutableArray *newCurrentCards = [[NSMutableArray alloc] initWithArray:currentCards];
        NSMutableArray *newRemainingCards = [[NSMutableArray alloc] initWithArray:remainingCards];
        
        [newCurrentCards addObject:newRemainingCards[i]];
        
        if (i + 1 >= [newRemainingCards count]) {
            [newRemainingCards removeAllObjects];
        }
        else {
            newRemainingCards = [[newRemainingCards subarrayWithRange:NSMakeRange(i + 1, [newRemainingCards count] - (i + 1))] mutableCopy];
        }
        
        [self searchForFifteenCounts:newCurrentCards remainingCards:newRemainingCards scores:scores];
    }
}

+ (NSInteger)addCards:(NSArray *)cards {
    NSInteger count = 0;
    
    for (Card *card in cards) {
        count += [card pipValue];
    }
    
    return count;
}

@end
