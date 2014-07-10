//
//  SSStockCell.m
//  SimStock
//
//  Created by Huo Ju on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStockCell.h"
#import "SimStock.h"


@implementation SSStockCell
@synthesize name = name_;
@synthesize prize = prize_;
@synthesize change = change_;


-(void)dealloc
{
    self.name = nil;
    self.prize = nil;
    self.change = nil;

    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //[self setEditing:YES];
        
        UIFont * font = [UIFont boldSystemFontOfSize:18];
        UIImageView * bg  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"color2.png"]];
        [self.contentView addSubview:bg];
        
        
        CGRect rect = [self frame];
        [bg setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+10)];
        
        
        
        self.name =  [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 50)] autorelease];
        [self.name setBackgroundColor:[UIColor clearColor]];
        [self.name setTextColor:[UIColor whiteColor]];
        self.prize = [[[UILabel alloc] initWithFrame:CGRectMake(180, 0, 80, 50)] autorelease];
        [self.prize setBackgroundColor:[UIColor clearColor]];
        [self.prize setTextColor:[UIColor whiteColor]];
        self.change = [[[UILabel alloc] initWithFrame:CGRectMake(255, 0, 80, 50)] autorelease];
        [self.change setBackgroundColor:[UIColor clearColor]];
        [self.change setTextColor:[UIColor whiteColor]];
        
        [self.name setFont:font];
        [self.prize setFont:font];
        [self.change setFont:font];
        
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.prize];
        [self.contentView addSubview:self.change];
       // [self addSubview:self.slider];
     //   [self.contentView addSubview:self.sliderText];
        
    }
    return self;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

-(void)valueChange
{
    NSLog(@"------");
    //[self.sliderText setText:[NSString stringWithFormat:@"当前持有数：%d手",(int)[self.slider value]]];
}
@end
