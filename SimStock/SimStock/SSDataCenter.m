//
//  SSDataCenter.m
//  SimStock
//
//  Created by Huo Ju on 12-4-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSDataCenter.h"
#import "SSStock.h"

@implementation SSDataCenter
@synthesize stockList = stockList_;
@synthesize recieveData = recieveData_;

static SSDataCenter * dataCenter_ = nil;

- (void)dealloc
{
    self.stockList = nil;
    self.recieveData = nil;
    [super dealloc];
}

- (id) init
{
    if (self = [super init]) {
        self.stockList = [NSMutableArray array];
        self.recieveData = [NSMutableData data];
    }  
    return self;
}

+ (id) sharedDataCenter
{
    @synchronized(self)
    {
        if (dataCenter_ == nil)
        {
            dataCenter_ = [[self alloc] init];
        }
    }
    return dataCenter_;
}

#pragma -
#pragma -- dataSource public -- 

- (void) reloadData
{
    NSLog(@"Reload Data");
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://finance.yahoo.com/d/quotes.csv?s=ATVI+EA+F+GM+GOOG+AAPL+XOM+JNJ+MSFT&f=snc1pr"]  cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];  
    
    NSURLConnection *theConnection = [[[NSURLConnection alloc] initWithRequest:theRequest delegate:self] autorelease];  
    if (theConnection) {
        NSLog(@"Connection");
    }
}

- (SSStock *) stockAtPath: (NSUInteger) index
{
    return [self.stockList objectAtIndex:index];
}

- (SSStock *) stockWithSimple:(NSString *) simple
{
    SSStock * stock;
    for (stock in self.stockList)
    {
        if([stock.sign isEqualToString:simple])
        {
            return stock;
        }
    }
    return nil;
}

- (NSUInteger) countOfStockList
{
    return [self.stockList count];
}
#pragma -
#pragma dataCenter private -

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"Recieving...\n");
    [self.recieveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Finish\n");
    NSString *str = [[NSString alloc] initWithData:self.recieveData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    NSArray *lines = [str componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSInteger idx;
    for (idx = lines.count-1; idx >= 0; idx--) {
        NSString *line = [lines objectAtIndex:idx];
        if([line isEqualToString:@""]){
            continue;
        }
        
        NSString *new = [line stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        NSArray* arr = [new componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        
        SSStock * stock = [[SSStock alloc] init];
        
        stock.sign = [arr objectAtIndex:0];
        stock.name = [arr objectAtIndex:1];
        stock.change = [arr objectAtIndex:2];
        stock.currentPrize = [arr objectAtIndex:3];
        stock.pe = [arr objectAtIndex:4];
        
        [self.stockList addObject:stock];
    }
    NSNotification * noti = [NSNotification notificationWithName:@"update" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
}
@end
