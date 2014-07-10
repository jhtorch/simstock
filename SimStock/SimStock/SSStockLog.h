//
//  SSStockLog.h
//  SimStock
//
//  Created by Huo Ju on 12-5-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSStockLog : NSObject<NSCoding>
{
    NSString * operation_;
    NSString * stockName_;
    NSDate * time_;
    NSInteger hands_;
    double totle_;
    double wealth_;
    double money_;
}

@property (strong) NSString * operation;
@property (strong) NSString * stockName;
@property (strong) NSDate * time;

-(double)getTotle;
-(double)getWealth;
-(double)getMoney;
-(NSInteger) getHands;

-(void)setTotle:(double)i;
-(void)setWealth:(double)i;
-(void)setMoney:(double)i;
-(void)setHands:(NSInteger)i;


@end
