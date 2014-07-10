//
//  NSString.m
//  SimStock
//
//  Created by Huo Ju on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSString.h"


@implementation NSString(Helpers)

-(NSString *)toUTF8String{  
    CFStringRef nonAlphaNumValidChars = CFSTR("![DISCUZ_CODE_1]’()*+,-./:;=?@_~");          
    NSString *preprocessedString = (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8);          
    NSString *newStr = [(NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)preprocessedString,NULL,nonAlphaNumValidChars,kCFStringEncodingUTF8) autorelease];  
    [preprocessedString release];  
    return newStr;          
}

@end
