//
//  Score.m
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import "Score.h"

@implementation Score

+ (Score *)scoreWithPoints:(NSInteger)points displayName:(NSString *)displayName cards:(NSArray *)cards {
    return [[Score alloc] initWithPoints:points displayName:displayName cards:cards];
}

- (id)initWithPoints:(NSInteger)points displayName:(NSString *)displayName cards:(NSArray *)cards {
    if (self = [super init]) {
        _points = points;
        _displayName = displayName;
        _cards = cards;
    }
    return self;
}

- (NSComparisonResult)compare:(Score *)other {
    if (self.points != other.points) {
        return [@(self.points) compare:@(other.points)];
    }
    return [self.displayName compare:other.displayName];
}

@end
