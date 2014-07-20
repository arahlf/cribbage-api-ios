//
//  CribbageAPI.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/20/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "ScoringRule.h"

@interface CribbageAPI : NSObject<ScoringRule>

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib;

@end
