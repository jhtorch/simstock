//
//  SSStockLog.m
//  SimStock
//
//  Created by Huo Ju on 12-5-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStockLog.h"

@implementation SSStockLog
@synthesize operation = operation_;
@synthesize stockName = stockName_;
@synthesize time = time_;


-(void)dealloc
{
    self.operation = nil;
    self.stockName = nil;
    self.time = nil;
    [super dealloc];
}
-(double)getTotle
{
    return  totle_;
}
-(double)getWealth
{
    return wealth_;
}
-(double)getMoney
{
    return money_;
}
-(NSInteger) getHands
{
    return hands_;
}

-(void)setTotle:(double)i
{
    totle_ = i;
}
-(void)setWealth:(double)i
{
    wealth_ = i;
}
-(void)setMoney:(double)i
{
    money_ = i;
}
-(void)setHands:(NSInteger)i
{
    hands_ = i;
}

- (void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.operation forKey:@"operation"];
    [encoder encodeObject:self.stockName forKey:@"stockname"];
    [encoder encodeObject:self.time forKey:@"time"];
    [encoder encodeObject:[[NSNumber alloc] initWithInteger:hands_] forKey:@"hands"];
    [encoder encodeObject:[[NSNumber alloc] initWithDouble:wealth_] forKey:@"wealth"];
    [encoder encodeObject:[[NSNumber alloc] initWithDouble:money_] forKey:@"money"];
    [encoder encodeObject:[[NSNumber alloc] initWithDouble:totle_] forKey:@"totle"];
}
- (id)initWithCoder:(NSCoder *)encoder
{
    [super init];
    self.operation = [encoder decodeObjectForKey:@"operation"];
    self.stockName = [encoder decodeObjectForKey:@"stockname"];
    self.time = [encoder decodeObjectForKey:@"time"];
    hands_ = [(NSNumber *)[encoder decodeObjectForKey:@"hands"] integerValue];
    wealth_ = [(NSNumber *)[encoder decodeObjectForKey:@"wealth"] doubleValue];
    money_ = [(NSNumber *)[encoder decodeObjectForKey:@"money"] doubleValue];
    totle_ = [(NSNumber *)[encoder decodeObjectForKey:@"totle"] doubleValue];
    return self;
}

@end
