//
//  SSStockLogCell.m
//  SimStock
//
//  Created by Huo Ju on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStockLogCell.h"

@implementation SSStockLogCell
@synthesize time;
@synthesize totle;
@synthesize wealth;
@synthesize name;
@synthesize money;
@synthesize prize;
@synthesize operation;
@synthesize hands;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //[self setBackgroundColor:[UIColor blackColor]];
        
        UIImageView * bg  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"historybar.png"]];
        [self.contentView addSubview:bg];
        
        CGRect rect = [self frame];
        [bg setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+25)];
        
        self.time = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 240, 40)];
        [self.time setBackgroundColor:[UIColor clearColor]];
        [self.time setTextColor:[UIColor whiteColor]];
        self.totle = [[UILabel alloc] initWithFrame:CGRectMake(240, 30, 140, 40)];
        [self.totle setBackgroundColor:[UIColor clearColor]];
        [self.totle setTextColor:[UIColor whiteColor]];
        
        //self.wealth = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 160, 40)];
        [self.name setBackgroundColor:[UIColor clearColor]];
        [self.name setTextColor:[UIColor whiteColor]];
        //self.prize = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.operation = [[UILabel alloc] initWithFrame:CGRectMake(255, 0, 40, 40)];
        [self.operation setBackgroundColor:[UIColor clearColor]];
        [self.operation setTextColor:[UIColor whiteColor]];
        //self.money = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.hands = [[UILabel alloc] initWithFrame:CGRectMake(190, 30, 40, 40)];
        [self.hands setBackgroundColor:[UIColor clearColor]];
        [self.hands setTextColor:[UIColor whiteColor]];
        
        [self addSubview:self.time];
        [self addSubview:self.totle];
        //[self addSubview:self.wealth];
        [self addSubview:self.name];
        //[self addSubview:self.prize];
        [self addSubview:self.operation];
        //[self addSubview:self.money];
        [self addSubview:self.hands];
        //self.totle = [[wealth] alloc] i
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
