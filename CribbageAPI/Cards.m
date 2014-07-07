//
//  Cards.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/6/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Cards.h"

// yes, this is totally evil... mostly just for lulz
#define DEFINE_CARD_ACCESSOR(accessor, rankValue, suitValue) + (Card *)accessor { return [[Card alloc] initWithRank:rankValue suit:suitValue]; }

@implementation Cards

DEFINE_CARD_ACCESSOR(aceOfClubs, Ace, Clubs);
DEFINE_CARD_ACCESSOR(twoOfClubs, Two, Clubs);
DEFINE_CARD_ACCESSOR(threeOfClubs, Three, Clubs);
DEFINE_CARD_ACCESSOR(fourOfClubs, Four, Clubs);
DEFINE_CARD_ACCESSOR(fiveOfClubs, Five, Clubs);
DEFINE_CARD_ACCESSOR(sixOfClubs, Six, Clubs);
DEFINE_CARD_ACCESSOR(sevenOfClubs, Seven, Clubs);
DEFINE_CARD_ACCESSOR(eightOfClubs, Eight, Clubs);
DEFINE_CARD_ACCESSOR(nineOfClubs, Nine, Clubs);
DEFINE_CARD_ACCESSOR(tenOfClubs, Ten, Clubs);
DEFINE_CARD_ACCESSOR(jackOfClubs, Jack, Clubs);
DEFINE_CARD_ACCESSOR(queenOfClubs, Queen, Clubs);
DEFINE_CARD_ACCESSOR(kingOfClubs, King, Clubs);

DEFINE_CARD_ACCESSOR(aceOfDiamonds, Ace, Diamonds);
DEFINE_CARD_ACCESSOR(twoOfDiamonds, Two, Diamonds);
DEFINE_CARD_ACCESSOR(threeOfDiamonds, Three, Diamonds);
DEFINE_CARD_ACCESSOR(fourOfDiamonds, Four, Diamonds);
DEFINE_CARD_ACCESSOR(fiveOfDiamonds, Five, Diamonds);
DEFINE_CARD_ACCESSOR(sixOfDiamonds, Six, Diamonds);
DEFINE_CARD_ACCESSOR(sevenOfDiamonds, Seven, Diamonds);
DEFINE_CARD_ACCESSOR(eightOfDiamonds, Eight, Diamonds);
DEFINE_CARD_ACCESSOR(nineOfDiamonds, Nine, Diamonds);
DEFINE_CARD_ACCESSOR(tenOfDiamonds, Ten, Diamonds);
DEFINE_CARD_ACCESSOR(jackOfDiamonds, Jack, Diamonds);
DEFINE_CARD_ACCESSOR(queenOfDiamonds, Queen, Diamonds);
DEFINE_CARD_ACCESSOR(kingOfDiamonds, King, Diamonds);

DEFINE_CARD_ACCESSOR(aceOfHearts, Ace, Hearts);
DEFINE_CARD_ACCESSOR(twoOfHearts, Two, Hearts);
DEFINE_CARD_ACCESSOR(threeOfHearts, Three, Hearts);
DEFINE_CARD_ACCESSOR(fourOfHearts, Four, Hearts);
DEFINE_CARD_ACCESSOR(fiveOfHearts, Five, Hearts);
DEFINE_CARD_ACCESSOR(sixOfHearts, Six, Hearts);
DEFINE_CARD_ACCESSOR(sevenOfHearts, Seven, Hearts);
DEFINE_CARD_ACCESSOR(eightOfHearts, Eight, Hearts);
DEFINE_CARD_ACCESSOR(nineOfHearts, Nine, Hearts);
DEFINE_CARD_ACCESSOR(tenOfHearts, Ten, Hearts);
DEFINE_CARD_ACCESSOR(jackOfHearts, Jack, Hearts);
DEFINE_CARD_ACCESSOR(queenOfHearts, Queen, Hearts);
DEFINE_CARD_ACCESSOR(kingOfHearts, King, Hearts);

DEFINE_CARD_ACCESSOR(aceOfSpades, Ace, Spades);
DEFINE_CARD_ACCESSOR(twoOfSpades, Two, Spades);
DEFINE_CARD_ACCESSOR(threeOfSpades, Three, Spades);
DEFINE_CARD_ACCESSOR(fourOfSpades, Four, Spades);
DEFINE_CARD_ACCESSOR(fiveOfSpades, Five, Spades);
DEFINE_CARD_ACCESSOR(sixOfSpades, Six, Spades);
DEFINE_CARD_ACCESSOR(sevenOfSpades, Seven, Spades);
DEFINE_CARD_ACCESSOR(eightOfSpades, Eight, Spades);
DEFINE_CARD_ACCESSOR(nineOfSpades, Nine, Spades);
DEFINE_CARD_ACCESSOR(tenOfSpades, Ten, Spades);
DEFINE_CARD_ACCESSOR(jackOfSpades, Jack, Spades);
DEFINE_CARD_ACCESSOR(queenOfSpades, Queen, Spades);
DEFINE_CARD_ACCESSOR(kingOfSpades, King, Spades);

@end
