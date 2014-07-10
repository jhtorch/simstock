//
//  SSStockCell.h
//  SimStock
//
//  Created by Huo Ju on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSStockCell : UITableViewCell
{
    UILabel * name_;
    UILabel * prize_;
    UILabel * change_;
}

@property (strong) UILabel *name;
@property (strong) UILabel *prize;
@property (strong) UILabel *change;

-(void)valueChange;
@end
