//
//  StartLevelTwoView.h
//  SimStock
//
//  Created by Huo Ju on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSCharacterView;
@class SSAccountView;
@interface SSStartLevelTwoView : UIView
{
    SSCharacterView * characterView_;
    SSAccountView * accountView_;
}

@property (strong) SSCharacterView * characterView;
@property (strong) SSAccountView * accountView;

- (void) reloadView;
@end
