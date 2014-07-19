//
//  CribbageScoringRules.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/19/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "CribbageScoringRules.h"
#import "Flush.h"
#import "Multiple.h"
#import "Nobs.h"
#import "Run.h"
#import "FifteenCount.h"

@interface CribbageScoringRules()

@property (nonatomic, strong) NSArray *scoringRules;

@end

@implementation CribbageScoringRules

- (id)init {
    if (self = [super init]) {
        self.scoringRules = @[
            [[Flush alloc] init],
            [[Multiple alloc] init],
            [[Nobs alloc] init],
            [[Run alloc] init],
            [[FifteenCount alloc] init]
        ];
    }
    return self;
}

- (NSArray *)scoreHand:(Hand *)hand cut:(Card *)cut {
    NSMutableArray *scores = [[NSMutableArray alloc] init];
    
    for (id<ScoringRule> scoringRule in self.scoringRules) {
        [scores addObjectsFromArray:[scoringRule scoreHand:hand cut:cut]];
    }
    
    return scores;
}

@end
