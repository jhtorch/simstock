//
//  StartViewController.m
//  SimStock
//
//  Created by Huo Ju on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStartViewController.h"
#import "SimStock.h"
@implementation SSStartViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [(SSStartView *)self.view setAccountDelegate:self];
}


#pragma -
#pragma delegate - 
- (void) setupAccount:(NSInteger)level
{
    [[SSAccountAssitant sharedAccountAssitant] setupAccount:level];
}

- (void) cancelAccount
{
    [[SSAccountAssitant sharedAccountAssitant] cancelAccount];
}
@end
