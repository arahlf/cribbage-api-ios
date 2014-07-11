//
//  Hand.h
//  CribbageAPI
//
//  Created by Alan Rahlf on 7/7/14.
//  Copyright (c) 2014 Alan Rahlf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Hand : NSObject

@property (readonly, nonatomic, strong) NSArray *cards;
@property (readonly, nonatomic, getter = isCrib) BOOL crib;

+ (Hand *)handWithCards:(NSArray *)cards crib:(BOOL)crib;

@end
