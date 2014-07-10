//
//  AccountAssitant.h
//  SimStock
//
//  Created by Huo Ju on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>




@class SSAccount;

@interface SSAccountAssitant : NSObject
{
    BOOL ifAccountExist_;
    SSAccount * account_;
}

@property (strong) SSAccount * account;

+ (id) sharedAccountAssitant;
- (BOOL) ifAccountExsit;
- (NSMutableDictionary *) setupCharacterDictionaryWithName:(NSString*)name job:(NSString*)job wealth:(double)wealth;
- (void) sync;
@end
