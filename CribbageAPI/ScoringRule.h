//
//  ScoringRule.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Card.h"
#import "Score.h"

@protocol ScoringRule <NSObject>

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib;

@end
