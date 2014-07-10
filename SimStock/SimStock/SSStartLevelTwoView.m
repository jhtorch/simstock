//
//  StartLevelTwoView.m
//  SimStock
//
//  Created by Huo Ju on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStartLevelTwoView.h"
#import "SimStock.h"

@implementation SSStartLevelTwoView
@synthesize characterView = characterView_;
@synthesize accountView = accountView_;

- (void)dealloc
{
    self.characterView = nil;
    self.accountView = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
        [self reloadView];

    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView) name:@"update" object:nil];
    return self;
}

- (void) reloadView
{
    SSAccountAssitant * accountAssitant = [SSAccountAssitant sharedAccountAssitant];
    if ([accountAssitant ifAccountExsit]) {
        
        [self.characterView removeFromSuperview];
        
        self.accountView = [[[SSAccountView alloc] initWithFrame:[self frame]] autorelease];
        [self addSubview:self.accountView];
        
//        [self.accountView setBackgroundColor:[UIColor redColor]];
//        [self.accountView.image setImage:[UIImage imageNamed:@"account.png"]];
//        [self.accountView.name setText:[[accountAssitant account] accountName]];
//        [self.accountView.job setText:[[accountAssitant account] accountJob]];
//        
        SSAccount * account = [[SSAccountAssitant sharedAccountAssitant] account];
        [self.accountView.text1 setText:[NSString stringWithFormat:@"$%.2f",[account currentWealth]]];
        [self.accountView.text1 setFrame:CGRectMake(70, 143, 100, 40)];
        [self.accountView.text2 setText:[NSString stringWithFormat:@"$%.2f",[account accountMoney]]];
        [self.accountView.text2 setFrame:CGRectMake(70, 185, 100, 40)];
        [self.accountView.text3 setText:[NSString stringWithFormat:@"%d",[[account accountLog] count]]];
        [self.accountView.text3 setFrame:CGRectMake(70, 230, 100, 40)];
//        [self.accountView.text4 setText:@"888"];
        
        UIImageView * bg = [[UIImageView alloc] initWithFrame:[self frame]];
        if ([[[accountAssitant account] accountName] isEqualToString: @"Micheal Allen"]) {
            [bg setImage:[UIImage imageNamed:@"1en-02.png"]];
        }
        else if([[[accountAssitant account] accountName] isEqualToString: @"Jeff Davis"]) 
        {
            [bg setImage:[UIImage imageNamed:@"2en-02.png"]];
        }
        else
        {
            [bg setImage:[UIImage imageNamed:@"3en-02.png"]];
        }
        [self.accountView addSubview:bg];
        
        
        
        [self.accountView loadView];
        
    }
    else
    {
       // [self setBackgroundColor:[UIColor yellowColor]];
        [self.accountView removeFromSuperview];
        
        self.characterView = [[[SSCharacterView alloc] initWithFrame:[self frame]] autorelease];
        [self addSubview:self.characterView];
        
//        [self.characterView setBackgroundColor:[UIColor yellowColor]];
//        [self.characterView.image setImage:[UIImage imageNamed:@"image.png"]];
//        [self.characterView.name setText:@"Jeff"];
//        [self.characterView.money setText:@"500,000$"];
//        [self.characterView.description setText:@"YYY"];
        
        UIImageView * bg = [[UIImageView alloc] initWithFrame:[self frame]];
        [bg setImage:[UIImage imageNamed:@"2en-01.png"]];
        [self.characterView addSubview:bg];
        
        [self.characterView loadView];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
