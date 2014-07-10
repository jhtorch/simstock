//
//  StartLevelThreeView.m
//  SimStock
//
//  Created by Huo Ju on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStartLevelThreeView.h"
#import "SimStock.h"
@implementation SSStartLevelThreeView
@synthesize characterView = characterView_;
@synthesize accountView = accountView_;

-(void)dealloc
{
    self.characterView = nil;
    self.accountView = nil;
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
//        [self.accountView.text1 setText:@"999"];
//        [self.accountView.text2 setText:@"000"];
//        [self.accountView.text3 setText:@"000"];
//        [self.accountView.text4 setText:@"000"];
        
        SSAccount * account = [[SSAccountAssitant sharedAccountAssitant] account];
        [self.accountView.text1 setText:[NSString stringWithFormat:@"$%.2f",[account maxMoney]]];
        [self.accountView.text1 setFrame:CGRectMake(170, 140, 100, 40)];
        [self.accountView.text2 setText:[NSString stringWithFormat:@"$%.2f",[account minMoney]]];
        [self.accountView.text2 setFrame:CGRectMake(170, 195, 100, 40)];
        [self.accountView.text3 setText:[NSString stringWithFormat:@"$%.2f",[account maxWealth]]];
        [self.accountView.text3 setFrame:CGRectMake(170, 250, 100, 40)];
        [self.accountView.text4 setText:[NSString stringWithFormat:@"$%.2f",[account minWealth]]];
        [self.accountView.text4 setFrame:CGRectMake(170, 305, 100, 40)];
        
        UIImageView * bg = [[UIImageView alloc] initWithFrame:[self frame]];
        if ([[[accountAssitant account] accountName] isEqualToString: @"Micheal Allen"]) {
            [bg setImage:[UIImage imageNamed:@"1en-03.png"]];
        }
        else if([[[accountAssitant account] accountName] isEqualToString: @"Jeff Davis"]) 
        {
            [bg setImage:[UIImage imageNamed:@"2en-03.png"]];
        }
        else
        {
            [bg setImage:[UIImage imageNamed:@"3en-03.png"]];
        }
        [self.accountView addSubview:bg];
        
        [self.accountView loadView];
        
    }
    else
    {
       //[self setBackgroundColor:[UIColor purpleColor]];
        [self.accountView removeFromSuperview];
        
        self.characterView = [[[SSCharacterView alloc] initWithFrame:[self frame]] autorelease];
        [self addSubview:self.characterView];
        
//        [self.characterView setBackgroundColor:[UIColor yellowColor]];
//        [self.characterView.image setImage:[UIImage imageNamed:@"image.png"]];
//        [self.characterView.name setText:@"Lucia"];
//        [self.characterView.money setText:@"5,000,000$"];
//        [self.characterView.description setText:@"ZZZ"];
        
        UIImageView * bg = [[UIImageView alloc] initWithFrame:[self frame]];
        [bg setImage:[UIImage imageNamed:@"3en-01.png"]];
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
