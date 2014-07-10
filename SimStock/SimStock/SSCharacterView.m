//
//  SSCharacterView.m
//  SimStock
//
//  Created by Huo Ju on 12-5-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSCharacterView.h"

@implementation SSCharacterView
@synthesize image = image_;
@synthesize name = name_;
@synthesize money = money_;
@synthesize description = description_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
        self.image = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 150, 250)] autorelease];
        self.name = [[[UILabel alloc] initWithFrame:CGRectMake(200, 50, 100, 30)] autorelease];
        self.money = [[[UILabel alloc] initWithFrame:CGRectMake(200, 100, 100, 30)] autorelease];
        self.description = [[[UILabel alloc] initWithFrame:CGRectMake(200, 150, 100, 30)] autorelease];
    }
    return self;
}


- (void)loadView
{
    //[self addSubview:self.image];
    //[self addSubview:self.name];
    //[self addSubview:self.money];
    //[self addSubview:self.description];
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
