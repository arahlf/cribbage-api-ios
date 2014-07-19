//
//  Score.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject

@property (readonly, nonatomic) NSInteger points;
@property (readonly, nonatomic, strong) NSString *displayName;
@property (readonly, nonatomic, strong) NSArray *cards;

+ (Score *)scoreWithPoints:(NSInteger)points displayName:(NSString *)displayName cards:(NSArray *)cards;

+ (NSInteger)totalPoints:(NSArray *)scores;

- (NSComparisonResult)compare:(Score *)other;

@end
