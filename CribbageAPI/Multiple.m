//
//  Multiple.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/10/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Multiple.h"

@implementation Multiple

- (NSArray *)scoreHand:(Hand *)hand cut:(Card *)cut {
    NSArray *allCards = [hand.cards arrayByAddingObject:cut];
    NSMutableDictionary *groups = [[NSMutableDictionary alloc] init];
    
    for (Card *card in allCards) {
        NSNumber *rank = @(card.rank);
        
        if (groups[rank] == nil) {
            groups[rank] = [[NSMutableArray alloc] init];
        }
        
        NSMutableArray *cards = groups[rank];
        
        [cards addObject:card];
    }
    
    NSMutableArray *scores = [[NSMutableArray alloc] init];
    
    for (NSArray *multiples in [groups allValues]) {
        NSParameterAssert([multiples count] < 5);
        
        switch ([multiples count]) {
            case 1:
                break;
            case 2:
                [scores addObject:[Score scoreWithPoints:2 displayName:@"Pair for 2" cards:multiples]];
                break;
            case 3:
                [scores addObject:[Score scoreWithPoints:6 displayName:@"Three of a kind for 6" cards:multiples]];
                break;
            case 4:
                [scores addObject:[Score scoreWithPoints:12 displayName:@"Four of a kind for 12" cards:multiples]];
                break;
            default:
                NSAssert([multiples count] < 5, @"Invalid multiple count: %i", [multiples count]);
        }
    }
    
    [scores sortUsingSelector:@selector(compare:)];
    
    return scores;
}

@end
