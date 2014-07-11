//
//  Nobs.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/10/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Nobs.h"

@implementation Nobs

- (NSArray *)scoreHand:(Hand *)hand cut:(Card *)cut {
    if (cut.rank != Jack) {
        for (Card *card in hand.cards) {
            if (card.rank == Jack && card.suit == cut.suit) {
                return @[ [Score scoreWithPoints:1 displayName:@"Nobs for 1" cards:@[card, cut]] ];
            }
        }
    }
    
    return @[];
}

@end
