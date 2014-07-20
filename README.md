
## Summary
CribbageAPI is a simple utility for scoring hands in Cribbage.

## Example Usage

```objective-c
#import "CribbageAPI.h"

NSArray *hand = @[FOUR_OF_SPADES, FIVE_OF_DIAMONDS, FIVE_OF_CLUBS, SIX_OF_HEARTS];

NSArray *scores = [CribbageAPI scoreHand:hand cut:TWO_OF_DIAMONDS crib:NO];

for (Score *score in scores) {
    NSLog(@"%@ - %@", score.displayName, score.cards);
}

/*
Outputs:

Pair for 2 - (
    "<Five of Diamonds>",
    "<Five of Clubs>"
)
Double run of three for 6 - (
    "<Four of Spades>",
    "<Five of Diamonds>",
    "<Five of Clubs>",
    "<Six of Hearts>"
)
Fifteen for 2 - (
    "<Four of Spades>",
    "<Five of Diamonds>",
    "<Six of Hearts>"
)
Fifteen for 2 - (
    "<Four of Spades>",
    "<Five of Clubs>",
    "<Six of Hearts>"
)
*/
```
