//
//  SimStock.h
//  SimStock
//
//  Created by Huo Ju on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#import "SSDataCenter.h" //singleton
#import "SSStock.h"
#import "SSStockLog.h"

#import "SSAccountAssitant.h" //singleton
#import "SSAccount.h"

#import "SSStockCell.h"
#import "SSStartView.h"
#import "SSStockBidViewController.h"

#import "SSStartView.h"
#import "SSCharacterView.h"
#import "SSStartLevelOneView.h"
#import "SSStartLevelTwoView.h"
#import "SSStartLevelThreeView.h"

#import "SSAccountView.h"

#import "CandleViewController.h"
#import "SSStockLogViewController.h"
#import "SSStockLogCell.h"


#define kSimStockAccount  @"simstockaccount"
#define kAccountExist @"accountExist"
#define kAccountUnExist @"accountUnExist"


#define kAccountpList @"account.plist"
#define kAccountList_Name @"name"  // NSString
#define kAccountList_Jobs @"job"  //NSString
#define kAccountList_Money @"money"  // NSNumber
#define kAccountList_StockList @"stocklist"  //NSDictionary
#define kAccountList_Max_Money @"maxmoney" // NSNumber 
#define kAccountList_Min_Money @"minmoney"   // NSNumber
#define kAccountList_Max_Wealth @"maxwealth"   //NSNumber
#define kAccountList_Min_Wealth @"minwealth"  //NSNumber
#define kAccountList_Log @"log" //NSDictionary




