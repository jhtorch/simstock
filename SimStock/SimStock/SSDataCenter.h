//
//  SSDataCenter.h
//  SimStock
//
//  Created by Huo Ju on 12-4-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SSStock;
@interface SSDataCenter : NSObject
{
    NSMutableArray * stockList_;
    NSMutableData * recieveData_;
}
@property (strong) NSMutableArray * stockList;
@property (strong) NSMutableData * recieveData;


+ (id) sharedDataCenter;
- (void) reloadData;

- (NSUInteger) countOfStockList;
- (SSStock *) stockAtPath: (NSUInteger) index;
- (SSStock *) stockWithSimple:(NSString *) simple;
@end
 