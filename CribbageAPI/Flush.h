//
//  Flush.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/8/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "ScoringRule.h"

@interface Flush : NSObject <ScoringRule>

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib;

@end
