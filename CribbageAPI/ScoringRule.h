//
//  ScoringRule.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hand.h"
#import "Score.h"

@protocol ScoringRule <NSObject>

- (NSArray *)scoreHand:(Hand *)hand cut:(Card *)cut;

@end
