//
//  SSStock.h
//  SimStock
//
//  Created by Huo Ju on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSStock : NSObject
{
    NSString * name_;
    NSString * sign_;
    NSString * currentPrize_;
    NSString * change_;
    NSString * pe_;
}
@property (strong) NSString * name;
@property (strong) NSString * sign;
@property (strong) NSString * currentPrize;
@property (strong) NSString * change;
@property (strong) NSString * pe;


- (double) getCurrentPrizeDoubleValue;

@end
