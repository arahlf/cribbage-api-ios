//
//  Hand.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Hand.h"

@implementation Hand

+ (Hand *)handWithCards:(NSArray *)cards crib:(BOOL)crib {
    return [[Hand alloc] initWithCards:cards crib:crib];
}

- (id)initWithCards:(NSArray *)cards crib:(BOOL)crib {
    if (self = [super init]) {
        NSParameterAssert([[NSSet setWithArray:cards] count] == 4);
        
        _cards = cards;
        _crib = crib;
    }
    return self;
}

@end
