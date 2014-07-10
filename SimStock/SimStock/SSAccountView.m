//
//  SSAccountView.m
//  SimStock
//
//  Created by Huo Ju on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSAccountView.h"

@implementation SSAccountView
@synthesize name = name_;
@synthesize job = job_;
@synthesize text1 = text1_;
@synthesize text2 = text2_;
@synthesize text3 = text3_;
@synthesize text4 = text4_;
@synthesize image = image_;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      //  self.image = [[[UIImageView alloc] initWithFrame:CGRectMake(30, 40, 160, 270)] autorelease];
       // self.name = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 30)] autorelease];
       // self.job = [[[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100, 30)] autorelease];
        
        self.text1 = [[[UILabel alloc] initWithFrame:CGRectMake(200, 150, 100, 30)] autorelease];
        [self.text1 setBackgroundColor:[UIColor clearColor]];
        [self.text1 setTextColor:[UIColor whiteColor]];
        self.text2 = [[[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 30)] autorelease];
        [self.text2 setBackgroundColor:[UIColor clearColor]];
        [self.text2 setTextColor:[UIColor whiteColor]];
        self.text3 = [[[UILabel alloc] initWithFrame:CGRectMake(200, 250, 100, 30)] autorelease];
        [self.text3 setBackgroundColor:[UIColor clearColor]];
        [self.text3 setTextColor:[UIColor whiteColor]];
        self.text4 = [[[UILabel alloc] initWithFrame:CGRectMake(200, 300, 100, 30)] autorelease];
        [self.text4 setBackgroundColor:[UIColor clearColor]];
        [self.text4 setTextColor:[UIColor whiteColor]];
    }
    return self;
}

- (void) loadView
{
   // [self addSubview:self.image];
   // [self addSubview:self.name];
   // [self addSubview:self.job];
    [self addSubview:self.text1];
    [self addSubview:self.text2];
    [self addSubview:self.text3];
    [self addSubview:self.text4];
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
