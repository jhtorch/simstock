//
//  Account.h
//  SimStock
//
//  Created by Huo Ju on 12-4-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimStock.h"
@interface SSAccount : NSObject
{
    NSString * accountName_;
    NSString * accountJob_;
    double  accountMoney_;
    double accountMaxMoney_;
    double accountMinMoney_;
    double accountMaxWealth_;
    double accountMinWealth_;
    NSMutableDictionary * accountStockList_;
    NSMutableArray * accountLog_;
}
@property (strong) NSString * accountName;
@property (strong) NSString * accountJob;
@property (strong) NSMutableDictionary * accountStockList;
@property (strong) NSMutableArray * accountLog;

- (id) initWithDictonary:(NSMutableDictionary *)dictionary;

- (double) currentWealth;

- (void) maxMoneyCheck;
- (void) minMoneyCheck;
- (void) maxWealthCheck;
- (void) minWealthCheck;

- (double) accountMoney;

- (double) maxMoney;
- (double) minMoney;
- (double) maxWealth;
- (double) minWealth;

- (int) handsOfStock:(NSString*)simple;
- (NSMutableDictionary *) dictionary;

- (BOOL) sellStock:(SSStock *)stock hands:(NSInteger) hands;
- (BOOL) buyStock:(SSStock *) stock hands:(NSInteger) hands;
@end
