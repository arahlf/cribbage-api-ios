//
//  CribbageAPI.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/20/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "CribbageAPI.h"
#import "Flush.h"
#import "Multiple.h"
#import "Nobs.h"
#import "Run.h"
#import "FifteenCount.h"

@implementation CribbageAPI

+ (NSArray *)scoreHand:(NSArray *)hand cut:(Card *)cut crib:(BOOL)crib {
    NSParameterAssert([[NSSet setWithArray:[hand arrayByAddingObject:cut]] count] == 5);
    
    NSMutableArray *scores = [[NSMutableArray alloc] init];
    
    [scores addObjectsFromArray:[Flush scoreHand:hand cut:cut crib:crib]];
    [scores addObjectsFromArray:[Multiple scoreHand:hand cut:cut crib:crib]];
    [scores addObjectsFromArray:[Nobs scoreHand:hand cut:cut crib:crib]];
    [scores addObjectsFromArray:[Run scoreHand:hand cut:cut crib:crib]];
    [scores addObjectsFromArray:[FifteenCount scoreHand:hand cut:cut crib:crib]];
    
    return scores;
}

@end
