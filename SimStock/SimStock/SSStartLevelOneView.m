//
//  StartLevelOneView.m
//  SimStock
//
//  Created by Huo Ju on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStartLevelOneView.h"
#import "SimStock.h"

@implementation SSStartLevelOneView
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
        //self.characterView = [[SSCharacterView alloc] initWithFrame:[self frame]];
        [self.characterView removeFromSuperview];
        self.characterView = nil;
        self.accountView = [[[SSAccountView alloc] initWithFrame:[self frame]] autorelease];
        [self addSubview:self.accountView];
        
        //[self.accountView setBackgroundColor:[UIColor redColor]];
        //[self.accountView.image setImage:[UIImage imageNamed:@"account.png"]];
        //[self.accountView.name setText:[[accountAssitant account] accountName]];
        //[self.accountView.job setText:[[accountAssitant account] accountJob]];
        
        UIImageView * bg = [[UIImageView alloc] initWithFrame:[self frame]];
        if ([[[accountAssitant account] accountName] isEqualToString: @"Micheal Allen"]) {
            [bg setImage:[UIImage imageNamed:@"1en-01.png"]];
        }
        else if([[[accountAssitant account] accountName] isEqualToString: @"Jeff Davis"]) 
        {
            [bg setImage:[UIImage imageNamed:@"2en-01.png"]];
        }
        else
        {
             [bg setImage:[UIImage imageNamed:@"3en-01.png"]];
        }
        [self.accountView addSubview:bg];
        
       // NSString * text1 = [NSString stringWithFormat:@"%.2f",[[accountAssitant account] accountMoney]]; 
       // [self.accountView.text1 setText:text1];
        
       // NSString *text2 = [NSString stringWithFormat:@"%.2f",[[accountAssitant account] currentWealth]];
       // [self.accountView.text2 setText:text2];
       // [self.accountView.text3 setText:@"333"];
       // [self.accountView.text4 setText:@"444"];
        
        [self.accountView loadView];
    }
    else
    {
        [self.accountView removeFromSuperview];
        self.accountView = nil;
        self.characterView = [[[SSCharacterView alloc] initWithFrame:[self frame]] autorelease];
        [self addSubview:self.characterView];
       // [self setBackgroundColor:[UIColor redColor]];
        
        //[self.characterView setBackgroundColor:[UIColor yellowColor]];
        
        UIImageView * bg = [[UIImageView alloc] initWithFrame:[self frame]];
        [bg setImage:[UIImage imageNamed:@"1en-01.png"]];
        [self.characterView addSubview:bg];
        
        //[self.characterView.image setImage:[UIImage imageNamed:@"image.png"]];
        //[self.characterView.name setText:@"Michael"];
        //[self.characterView.money setText:@"50,000$"];
        //[self.characterView.description setText:@"XXX"];
        
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
