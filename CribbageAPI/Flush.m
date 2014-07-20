//
//  Flush.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/8/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Flush.h"
#import "Suit.h"

@implementation Flush

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib {
    Suit suit = ((Card *)hand[0]).suit;
    
    for (Card *card in hand) {
        if (card.suit != suit) {
            return @[];
        }
    }
    
    if (cut.suit == suit) {
        return @[ [Score scoreWithPoints:5 displayName:@"Flush (5 card) for 5" cards:[hand arrayByAddingObject:cut]] ];
    }
    
    if (!crib) {
        return @[ [Score scoreWithPoints:4 displayName:@"Flush (4 card) for 4" cards:hand] ];
    }
    
    return @[];
}

@end
