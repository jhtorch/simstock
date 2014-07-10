//
//  SSStock.m
//  SimStock
//
//  Created by Huo Ju on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStock.h"

@implementation SSStock
@synthesize name = name_;
@synthesize sign = sign_;
@synthesize currentPrize = currentPrize_;
@synthesize change = change_;
@synthesize pe = pe_;
- (void) dealloc
{
    self.name = nil;
    self.sign = nil;
    self.currentPrize = nil;
    self.change = nil;
    self.pe = nil;
    [super dealloc];
}

- (double) getCurrentPrizeDoubleValue
{
    return [self.currentPrize doubleValue];
}

@end
