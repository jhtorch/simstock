//
//  SSStockBidViewController.m
//  SimStock
//
//  Created by Huo Ju on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStockBidViewController.h"

@implementation SSStockBidViewController
@synthesize handsHold;
@synthesize forecast;
@synthesize hands;
@synthesize titleView;
@synthesize slider;
@synthesize casher;
@synthesize stock;

- (id)initWithStock:(SSStock *)istock
{
    self.stock = istock;
    [self.titleView setTitle:[istock name]];
    
    SSAccount* account = [[SSAccountAssitant sharedAccountAssitant] account];
    
    int a = [account handsOfStock:[istock sign]];
    int b = (int)([account accountMoney]/100/[self.stock.currentPrize doubleValue]); 
    
    hand_ = a;
    
    if ([istock.pe doubleValue] >= 50) {
        [self.forecast setText:@"sold"];
    }
    else if([istock.pe doubleValue] >= 10 && [istock.pe doubleValue] < 50)
    {
        [self.forecast setText:@"wait and see"];
    }
    else
    {
        [self.forecast setText:@"holds"];
    }
    
    [self.handsHold setText:[NSString stringWithFormat:@"%d hand(s)",a]];

    
    [self.slider setMinimumValue:0];
    [self.slider setMaximumValue:a+b];
    [self.slider setValue:a];
    
    [self.hands setText:[NSString stringWithFormat:@"%d hand(s)",(int)[self.slider value]]];
    
    [self.casher setText:@"$0"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView) name:@"update" object:nil];
    return self;
}

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {

        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
       
    }
    [super awakeFromNib];
}

- (void)reloadView
{
    SSAccount* account = [[SSAccountAssitant sharedAccountAssitant] account];
    
    int a = [account handsOfStock:[self.stock sign]];
    int b = (int)([account accountMoney]/100/[self.stock.currentPrize doubleValue]); 
    
    hand_ = a;
    
    [self.handsHold setText:[NSString stringWithFormat:@"%d hand(s)",a]];
    
    
    [self.slider setMinimumValue:0];
    [self.slider setMaximumValue:a+b];
    [self.slider setValue:a];
    
    [self.hands setText:[NSString stringWithFormat:@"%d hand(s)",(int)[self.slider value]]];
    
    [self.casher setText:@"$0"];
}

- (void) viewDidLoad
{
    [self.view setFrame:CGRectMake(0, 0, 320, 600)];
    [super viewDidLoad];
}
- (IBAction)back:(id)sender {
    CATransition *animation = [CATransition animation]; 
    animation.duration = 0.5f; 
    animation.timingFunction = UIViewAnimationCurveEaseInOut; 
    animation.fillMode = kCAFillModeForwards; 
    animation.type = kCATransitionPush; 
    animation.subtype = kCATransitionFromLeft; 
    [self.view.superview.layer addAnimation:animation forKey:@"animation"]; 
    [self.view removeFromSuperview]; 
}

- (IBAction)detail:(id)sender {
    CandleViewController * secondview = [[CandleViewController alloc] init];
    [self.view addSubview:secondview.view]; 
    [secondview reload:self.stock.sign];
    CATransition *animation = [CATransition animation]; 
    animation.delegate = self; 
    animation.duration = 0.5f; 
    animation.timingFunction = UIViewAnimationCurveEaseInOut; 
    animation.fillMode = kCAFillModeForwards; 
    animation.type = kCATransitionPush; 
    animation.subtype = kCATransitionFromRight; 
    [self.view.layer addAnimation:animation forKey:@"animation"]; 
}

- (IBAction)buyAll:(id)sender {
    [self.slider setValue:self.slider.maximumValue];
    [self valueChanged:self];
}

- (IBAction)sellOut:(id)sender {
    [self.slider setValue:self.slider.minimumValue];
    [self valueChanged:self];
}

- (IBAction)complete:(id)sender {
    SSAccount * account = [[SSAccountAssitant sharedAccountAssitant] account];
    
    int a = (int)[self.slider value] - hand_;
    if (a > 0) {
        [account buyStock:self.stock hands:a]; 
    }
    if (a < 0) {
        [account sellStock:self.stock hands:0 - a];
    }
    
    
}

- (IBAction)cancel:(id)sender {
    [self.slider setValue:hand_];
    [self valueChanged:self];
}

- (IBAction)valueChanged:(id)sender {

    [self.hands setText:[NSString stringWithFormat:@"%d hand(s)",(int)[self.slider value]]];
    int a = [self.slider value];
    int b = hand_;
    
    float c = (b - a) * 100 * [[self.stock currentPrize] doubleValue];
    
    [self.casher setText:[NSString stringWithFormat:@"%.2f$",c]];
    
}
- (void)dealloc {
    [handsHold release];
    [forecast release];
    [hands release];
    [titleView release];
    [slider release];
    [casher release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setHandsHold:nil];
    [self setForecast:nil];
    [self setHands:nil];
    [self setTitle:nil];
    [self setSlider:nil];
    [self setCasher:nil];
    [super viewDidUnload];
}
@end
