//
//  Cards.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/6/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Cards : NSObject

#define CardAccessor(rankValue, suitValue) [Card cardWithRank:rankValue suit:suitValue]

#define ACE_OF_CLUBS CardAccessor(Ace, Clubs)
#define TWO_OF_CLUBS CardAccessor(Two, Clubs)
#define THREE_OF_CLUBS CardAccessor(Three, Clubs)
#define FOUR_OF_CLUBS CardAccessor(Four, Clubs)
#define FIVE_OF_CLUBS CardAccessor(Five, Clubs)
#define SIX_OF_CLUBS CardAccessor(Six, Clubs)
#define SEVEN_OF_CLUBS CardAccessor(Seven, Clubs)
#define EIGHT_OF_CLUBS CardAccessor(Eight, Clubs)
#define NINE_OF_CLUBS CardAccessor(Nine, Clubs)
#define TEN_OF_CLUBS CardAccessor(Ten, Clubs)
#define JACK_OF_CLUBS CardAccessor(Jack, Clubs)
#define QUEEN_OF_CLUBS CardAccessor(Queen, Clubs)
#define KING_OF_CLUBS CardAccessor(King, Clubs)

#define ACE_OF_DIAMONDS CardAccessor(Ace, Diamonds)
#define TWO_OF_DIAMONDS CardAccessor(Two, Diamonds)
#define THREE_OF_DIAMONDS CardAccessor(Three, Diamonds)
#define FOUR_OF_DIAMONDS CardAccessor(Four, Diamonds)
#define FIVE_OF_DIAMONDS CardAccessor(Five, Diamonds)
#define SIX_OF_DIAMONDS CardAccessor(Six, Diamonds)
#define SEVEN_OF_DIAMONDS CardAccessor(Seven, Diamonds)
#define EIGHT_OF_DIAMONDS CardAccessor(Eight, Diamonds)
#define NINE_OF_DIAMONDS CardAccessor(Nine, Diamonds)
#define TEN_OF_DIAMONDS CardAccessor(Ten, Diamonds)
#define JACK_OF_DIAMONDS CardAccessor(Jack, Diamonds)
#define QUEEN_OF_DIAMONDS CardAccessor(Queen, Diamonds)
#define KING_OF_DIAMONDS CardAccessor(King, Diamonds)

#define ACE_OF_HEARTS CardAccessor(Ace, Hearts)
#define TWO_OF_HEARTS CardAccessor(Two, Hearts)
#define THREE_OF_HEARTS CardAccessor(Three, Hearts)
#define FOUR_OF_HEARTS CardAccessor(Four, Hearts)
#define FIVE_OF_HEARTS CardAccessor(Five, Hearts)
#define SIX_OF_HEARTS CardAccessor(Six, Hearts)
#define SEVEN_OF_HEARTS CardAccessor(Seven, Hearts)
#define EIGHT_OF_HEARTS CardAccessor(Eight, Hearts)
#define NINE_OF_HEARTS CardAccessor(Nine, Hearts)
#define TEN_OF_HEARTS CardAccessor(Ten, Hearts)
#define JACK_OF_HEARTS CardAccessor(Jack, Hearts)
#define QUEEN_OF_HEARTS CardAccessor(Queen, Hearts)
#define KING_OF_HEARTS CardAccessor(King, Hearts)

#define ACE_OF_SPADES CardAccessor(Ace, Spades)
#define TWO_OF_SPADES CardAccessor(Two, Spades)
#define THREE_OF_SPADES CardAccessor(Three, Spades)
#define FOUR_OF_SPADES CardAccessor(Four, Spades)
#define FIVE_OF_SPADES CardAccessor(Five, Spades)
#define SIX_OF_SPADES CardAccessor(Six, Spades)
#define SEVEN_OF_SPADES CardAccessor(Seven, Spades)
#define EIGHT_OF_SPADES CardAccessor(Eight, Spades)
#define NINE_OF_SPADES CardAccessor(Nine, Spades)
#define TEN_OF_SPADES CardAccessor(Ten, Spades)
#define JACK_OF_SPADES CardAccessor(Jack, Spades)
#define QUEEN_OF_SPADES CardAccessor(Queen, Spades)
#define KING_OF_SPADES CardAccessor(King, Spades)

@end
