//
//  NSDate.h
//  SimStock
//
//  Created by Huo Ju on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (Helpers)

+ (NSString *)dbFormatString;
- (NSUInteger)getYear;
- (NSUInteger)getMonth;
- (NSDate *)endOfWeek;
- (NSUInteger)getDay;
- (NSDate *)dateAfterDay:(int)day;
- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
@end
