//
//  StartView.h
//  SimStock
//
//  Created by Huo Ju on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SimStock.h"

@protocol StartViewDelegate <NSObject>

- (void) setupAccount:(NSInteger)level;
- (void) cancelAccount;

@end

@interface SSStartView : UIView
{
   // id<StartViewDelegate> accountDelegate_;
    
    UIPageControl * pageControl_;
    CGPoint startTouchPosition_;
    NSMutableArray * levelViews_;
    NSString *dirString_;
    UIView * subView_;
    
    UIButton * acountButton_;
    UIButton * cancelButton_;
    
}

@property (strong) UIPageControl * pageControl;
@property (strong) NSMutableArray * levelViews;
@property (strong) NSString *dirString; 
@property (strong) UIView * subView;
@property (strong) UIButton * acountButton;
@property (assign) id<StartViewDelegate> accountDelegate;
@property (strong) UIButton * cancelButton;

- (void) swipeTo:(NSString *)string;
- (CATransition *) getAnimation:(NSString *) direction;
- (void) reload;

//button action

- (void)setupAccount;
- (void)cancelAccount;
@end
