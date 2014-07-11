//
//  Score.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Score.h"

@implementation Score

- (id)initWithPoints:(NSInteger)points displayName:(NSString *)displayName cards:(NSArray *)cards {
    if (self = [super init]) {
        _points = points;
        _displayName = displayName;
        _cards = cards;
    }
    return self;
}

@end
