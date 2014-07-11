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

- (NSArray *)scoreHand:(Hand *)hand cut:(Card *)cut {
    Suit suit = ((Card *)hand.cards[0]).suit;
    
    for (Card *card in hand.cards) {
        if (card.suit != suit) {
            return @[];
        }
    }
    
    if (cut.suit == suit) {
        return @[[[Score alloc] initWithPoints:5 displayName:@"Flush (5 card) for 5" cards:[hand.cards arrayByAddingObject:cut]]];
    }
    
    if (!hand.isCrib) {
        return @[[[Score alloc] initWithPoints:4 displayName:@"Flush (4 card) for 4" cards:hand.cards]];
    }
    
    return @[];
}

@end
