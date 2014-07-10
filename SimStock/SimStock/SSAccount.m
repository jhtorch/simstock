//
//  Account.m
//  SimStock
//
//  Created by Huo Ju on 12-4-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSAccount.h"
#import "SimStock.h"

@implementation SSAccount
@synthesize accountName = accountName_;
@synthesize accountStockList = accountStockList_;
@synthesize accountLog = accountLog_;
@synthesize accountJob = accountJob_;

- (void)dealloc
{
    self.accountName = nil;
    self.accountJob = nil;
    self.accountLog = nil;
    self.accountStockList = nil;
    [super dealloc];
}

- (id) init
{
    if (self = [super init]) {

    } 
    return self;
}

- (id) initWithDictonary:(NSMutableDictionary *)dictionary
{
    if (self= [super init])
    {
        self.accountName = [dictionary objectForKey:kAccountList_Name];
        self.accountStockList = [dictionary objectForKey:kAccountList_StockList];
        self.accountJob = [dictionary objectForKey:kAccountList_Jobs];
        
        accountMoney_ = [(NSNumber *)[dictionary objectForKey:kAccountList_Money] doubleValue];
        accountMaxMoney_ = [(NSNumber *)[dictionary objectForKey:kAccountList_Max_Money] doubleValue];
        accountMinMoney_ = [(NSNumber *)[dictionary objectForKey:kAccountList_Min_Money] doubleValue];
        accountMaxWealth_ = [(NSNumber *)[dictionary objectForKey:kAccountList_Max_Wealth] doubleValue];
        accountMinWealth_ = [(NSNumber *)[dictionary objectForKey:kAccountList_Min_Wealth] doubleValue];
        
        self.accountLog = [dictionary objectForKey:kAccountList_Log];
    }
    return self;
}

- (BOOL) buyStock:(SSStock *) stock hands:(NSInteger) hands
{
    if (accountMoney_ - hands*[stock getCurrentPrizeDoubleValue] < 0) {
        NSLog(@"not have enough money");
        return NO; 
    }
    
    accountMoney_ = accountMoney_ - hands*100*[stock getCurrentPrizeDoubleValue];  
    NSNumber * value = [self.accountStockList objectForKey:stock.sign];
    if (value) {
        NSInteger a = [value integerValue] + hands;
        NSNumber * b = [[[NSNumber alloc] initWithInteger:a] autorelease];
        [self.accountStockList setObject:b forKey:stock.sign];
    }
    else{
        NSNumber * b = [[[NSNumber alloc] initWithInteger:hands] autorelease];
        [self.accountStockList setObject:b forKey:stock.sign];
    }
    
    SSStockLog * stocklog = [[[SSStockLog alloc] init] autorelease];
    stocklog.operation = @"Buy";
    [stocklog setTime:[NSDate date]];
    stocklog.stockName = [stock name];
    [stocklog setTotle:[stock getCurrentPrizeDoubleValue]*100*hands];
    [stocklog setWealth:self.currentWealth];
    [stocklog setMoney:self.accountMoney];
    [stocklog setHands:hands];
    
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:stocklog];
    [self.accountLog addObject:data];
    
    [self maxMoneyCheck];
    [self minMoneyCheck];
    [self maxWealthCheck];
    [self minWealthCheck];

    [[SSAccountAssitant sharedAccountAssitant] sync];
    
    NSNotification * noti = [NSNotification notificationWithName:@"update" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    return YES;
}

- (BOOL) sellStock:(SSStock *)stock hands:(NSInteger) hands
{
    accountMoney_ = accountMoney_ + hands*100*[stock getCurrentPrizeDoubleValue];  
    
    NSNumber * value = [self.accountStockList objectForKey:stock.sign];
    NSInteger a = [value integerValue] - hands;
    NSNumber * b = [[[NSNumber alloc] initWithInteger:a] autorelease];
    [self.accountStockList setObject:b forKey:stock.sign];
    
    if (a == 0) {
        [self.accountStockList removeObjectForKey:stock.sign];
    }
    
    SSStockLog * stocklog = [[[SSStockLog alloc] init] autorelease];
    stocklog.operation = @"Sell";
    [stocklog setTime:[NSDate date]];
    stocklog.stockName = [stock name];
    [stocklog setTotle:[stock getCurrentPrizeDoubleValue]*100*hands];
    [stocklog setWealth:self.currentWealth];
    [stocklog setMoney:self.accountMoney];
    [stocklog setHands:hands];
    
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:stocklog];
    [self.accountLog addObject:data];

    [self maxMoneyCheck];
    [self minMoneyCheck];
    [self maxWealthCheck];
    [self minWealthCheck];
    [[SSAccountAssitant sharedAccountAssitant] sync];
    
    NSNotification * noti = [NSNotification notificationWithName:@"update" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    return YES;
}

- (double) currentWealth
{
    double wealth = accountMoney_;
    
    SSDataCenter * dataCenter = [SSDataCenter sharedDataCenter];
    for (NSString * key in [self.accountStockList allKeys])
    {
        SSStock* stock = [dataCenter stockWithSimple:key];
        NSInteger hands = [(NSNumber *)[self.accountStockList objectForKey:key] integerValue];
        
        wealth += [stock.currentPrize doubleValue] * hands * 100;
    }
    return wealth;
}

- (void) maxMoneyCheck
{
    if ( accountMoney_ > accountMaxMoney_) {
        accountMaxMoney_ = accountMoney_;
    }
}

- (void) minMoneyCheck
{
    if ( accountMoney_ < accountMinMoney_) {
        accountMinMoney_ = accountMoney_;
    }
}

- (void) maxWealthCheck
{
    double curWealth = [self currentWealth];
    if ( curWealth > accountMaxWealth_) {
        accountMaxWealth_ = curWealth;
    }
}
- (void) minWealthCheck
{
    double curWealth = [self currentWealth];
    if ( curWealth < accountMinWealth_) {
        accountMinWealth_ = curWealth;
    }
}

- (double) accountMoney
{
    return accountMoney_;
}

- (NSMutableDictionary *) dictionary
{
    NSMutableDictionary * accountlist = [NSMutableDictionary dictionary];
    
    [accountlist setObject:self.accountName forKey:kAccountList_Name];
    [accountlist setObject:self.accountJob forKey:kAccountList_Jobs];
    
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:accountMoney_]autorelease] forKey:kAccountList_Money];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:accountMaxMoney_]autorelease] forKey:kAccountList_Max_Money];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:accountMinMoney_]autorelease] forKey:kAccountList_Min_Money];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:accountMaxWealth_]autorelease] forKey:kAccountList_Max_Wealth];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:accountMinWealth_]autorelease] forKey:kAccountList_Min_Wealth];
    
    [accountlist setObject:self.accountStockList forKey:kAccountList_StockList];
    [accountlist setObject:self.accountLog forKey:kAccountList_Log];
    
    return accountlist;
    
}

- (int) handsOfStock:(NSString *)simple
{
   NSNumber * hands =  [self.accountStockList objectForKey:simple];
    int a = [hands intValue];
    return a;
}

- (double) maxMoney
{
    return accountMaxMoney_;
}
- (double) minMoney
{
    return accountMinMoney_;
}
- (double) maxWealth
{
    return accountMaxWealth_;
}
- (double) minWealth
{
    return accountMinWealth_;
}
@end
