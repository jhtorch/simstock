//
//  StockInfoViewController.m
//  SimStock
//
//  Created by Huo Ju on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StockInfoViewController.h"
#import "SimStock.h"
@implementation StockInfoViewController
@synthesize sbview;
- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}


- (void) viewDidLoad
{
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [super viewDidLoad];
}


#pragma -
#pragma delegate - 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{  
    SSDataCenter * dataCenter =  [SSDataCenter sharedDataCenter];
    SSStock* stock = [dataCenter stockAtPath:[indexPath row]];
    //    CandleViewController * secondview = [[CandleViewController alloc] init];
    //    [self.view addSubview:secondview.view]; 
    //    NSLog(@"second"); 
    //    CATransition *animation = [CATransition animation]; 
    //    animation.delegate = self; 
    //    animation.duration = 0.5f; 
    //    animation.timingFunction = UIViewAnimationCurveEaseInOut; 
    //    animation.fillMode = kCAFillModeForwards; 
    //    animation.type = kCATransitionPush; 
    //    animation.subtype = kCATransitionFromRight; 
    //    [self.view.layer addAnimation:animation forKey:@"animation"]; 
    
    
    
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    self.sbview = [sb instantiateViewControllerWithIdentifier:@"StockBid"];
    
    //   SSStockBidViewController * stockBidViewController = [[SSStockBidViewController alloc] initWithFrame:[self.view frame]];
    
    [self.view addSubview:self.sbview.view];
    [self.sbview initWithStock:stock];
    
    CATransition *animation = [CATransition animation]; 
    animation.delegate = self; 
    animation.duration = 0.5f; 
    animation.timingFunction = UIViewAnimationCurveEaseInOut; 
    animation.fillMode = kCAFillModeForwards; 
    animation.type = kCATransitionPush; 
    animation.subtype = kCATransitionFromRight; 
    [self.view.layer addAnimation:animation forKey:@"animation"]; 
}



#pragma -
#pragma dataSource Delegate - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SSDataCenter * dataCenter =  [SSDataCenter sharedDataCenter];
    return [dataCenter countOfStockList];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSStockCell * cell = [[[SSStockCell alloc] init] autorelease];
    
    SSDataCenter * dataCenter =  [SSDataCenter sharedDataCenter];
    SSStock* stock = [dataCenter stockAtPath:[indexPath row]];
    [cell.name setText:stock.name];
    [cell.prize setText:stock.currentPrize];
    [cell.change setText:stock.change];
    return cell;
}
@end
