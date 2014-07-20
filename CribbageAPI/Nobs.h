//
//  Nobs.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/10/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "ScoringRule.h"

@interface Nobs : NSObject <ScoringRule>

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib;

@end
