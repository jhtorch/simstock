//
//  AccountAssitant.m
//  SimStock
//
//  Created by Huo Ju on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSAccountAssitant.h"
#import "SimStock.h"
@implementation SSAccountAssitant
@synthesize account = account_;

static SSAccountAssitant * accountAssitant_ = nil; 

- (void) dealloc
{
    self.account = nil;
    [super dealloc];
}

- (id) init
{
    if (self = [super init]) 
    {
        NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
        if ([[userDefault objectForKey:kSimStockAccount] isEqualToString:kAccountExist]) 
        {
            ifAccountExist_ = YES;
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
            NSString * path = [paths objectAtIndex:0];
            NSString *filename = [path stringByAppendingPathComponent:kAccountpList];
            NSMutableDictionary * accountlist = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
            
            self.account = [[[SSAccount alloc] initWithDictonary:accountlist] autorelease];
        } 
        else 
        {
            ifAccountExist_ = NO;
        }
    }
    return self;
}

+ (id) sharedAccountAssitant
{
    @synchronized(self)
    {
        if (accountAssitant_ == nil)
        {
            accountAssitant_ = [[self alloc] init];
        }
    }
    return accountAssitant_;
}

- (BOOL) ifAccountExsit
{
    return ifAccountExist_;
}

- (void) cancelAccount
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:kAccountUnExist forKey:kSimStockAccount];
    ifAccountExist_ = NO;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString * path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:kAccountpList];
    NSMutableDictionary * voidDic = [NSMutableDictionary dictionary];
    if (![voidDic writeToFile:filename atomically:YES]) {
        NSLog(@"saving failed");
    } 
    
    NSNotification * noti = [NSNotification notificationWithName:@"update" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    
}

- (void) setupAccount:(NSInteger) level
{
    NSMutableDictionary * accountlist = nil;
    
    if (level == 1) {
        accountlist = [self setupCharacterDictionaryWithName:@"Micheal Allen" job:@"作家" wealth:50000];
    }
    else if (level == 2){
        accountlist = [self setupCharacterDictionaryWithName:@"Jeff Davis" job:@"科学家" wealth:500000];
    }
    else if (level == 3){
        accountlist = [self setupCharacterDictionaryWithName:@"Lucia Feng" job:@"银行家" wealth:5000000];
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString * path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:kAccountpList];
    
    BOOL re = [accountlist writeToFile:filename atomically:YES];
    if (!re) {
        NSLog(@"saving failed");
    }
    
    self.account = [[[SSAccount alloc] initWithDictonary:accountlist] autorelease];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:kAccountExist forKey:kSimStockAccount];
    ifAccountExist_ = YES;
    
    NSNotification * noti = [NSNotification notificationWithName:@"update" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}

- (NSMutableDictionary *) setupCharacterDictionaryWithName:(NSString*)name job:(NSString*)job wealth:(double)wealth
{
    NSMutableDictionary * accountlist = [NSMutableDictionary dictionary];
    
    [accountlist setObject:name forKey:kAccountList_Name];
    [accountlist setObject:job forKey:kAccountList_Jobs];
    
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:wealth] autorelease] forKey:kAccountList_Money];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:wealth] autorelease] forKey:kAccountList_Max_Money];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:wealth] autorelease] forKey:kAccountList_Min_Money];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:wealth] autorelease] forKey:kAccountList_Max_Wealth];
    [accountlist setObject:[[[NSNumber alloc] initWithDouble:wealth] autorelease] forKey:kAccountList_Min_Wealth];
    
    [accountlist setObject:[NSMutableDictionary dictionary] forKey:kAccountList_StockList];
    [accountlist setObject:[NSMutableArray array] forKey:kAccountList_Log];
    
    return accountlist;
}
- (void) sync
{
    NSMutableDictionary * dic = [self.account dictionary];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString * path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:kAccountpList];
    if (![dic writeToFile:filename atomically:YES]) {
        NSLog(@"saving failed");
    }
}
@end
