//
//  SSStockBidViewController.h
//  SimStock
//
//  Created by Huo Ju on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimStock.h"
@interface SSStockBidViewController : UIViewController
{
    int hand_;
}


@property (assign) SSStock * stock;
@property (retain, nonatomic) IBOutlet UILabel *handsHold;
@property (retain, nonatomic) IBOutlet UILabel *forecast;
@property (retain, nonatomic) IBOutlet UILabel *hands;
@property (retain, nonatomic) IBOutlet UINavigationItem *titleView;
@property (retain, nonatomic) IBOutlet UISlider *slider;
@property (retain, nonatomic) IBOutlet UILabel *casher;


- (IBAction)back:(id)sender;
- (IBAction)detail:(id)sender;
- (IBAction)buyAll:(id)sender;
- (IBAction)sellOut:(id)sender;
- (IBAction)complete:(id)sender;
- (IBAction)cancel:(id)sender;

- (IBAction)valueChanged:(id)sender;
- (id) initWithStock:(SSStock*) stock;
@end
