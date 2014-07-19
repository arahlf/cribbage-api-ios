//
//  CribbageScoringRules.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/19/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScoringRule.h"

@interface CribbageScoringRules : NSObject<ScoringRule>

- (NSArray *)scoreHand:(Hand *)hand cut:(Card *)cut;

@end
