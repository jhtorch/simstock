//
//  StartView.m
//  SimStock
//
//  Created by Huo Ju on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSStartView.h"
#import "SimStock.h"

@implementation SSStartView
@synthesize pageControl = pageControl_;
@synthesize levelViews = levelViews_;
@synthesize dirString = dirString_;
@synthesize subView = subView_;
@synthesize acountButton = acountButton_;
@synthesize cancelButton = cancelButton_;
@synthesize accountDelegate;// = accountDelegate_;

- (void)dealloc
{
    self.pageControl = nil;
    self.levelViews = nil;
    self.dirString = nil;
    self.subView = nil;
    self.acountButton = nil;
    self.accountDelegate = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)awakeFromNib
{
    self.subView = [[[UIView alloc] initWithFrame:[self frame]] autorelease];
    [self addSubview:self.subView];
    
    self.levelViews = [NSMutableArray array];
    
    UIView* currentView3 = [[[SSStartLevelOneView alloc] initWithFrame:[self frame]] autorelease];
    [self.subView addSubview:currentView3];
    [currentView3 setHidden:NO];
    UIView* currentView2 = [[[SSStartLevelThreeView alloc] initWithFrame:[self frame]] autorelease];
    [self.subView addSubview:currentView2];
    [currentView2 setHidden:YES];
    UIView* currentView1 = [[[SSStartLevelTwoView alloc] initWithFrame:[self frame]] autorelease];
    [self.subView addSubview:currentView1];
    [currentView1 setHidden:YES];
    
    [self.levelViews addObject:currentView1];
    [self.levelViews addObject:currentView2];
    [self.levelViews addObject:currentView3];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 380, 120, 27)];
    //self.pageControl.backgroundColor=[UIColor blackColor];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    [self addSubview:self.pageControl];
    
    self.acountButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 350, 90, 27)];
    [self.acountButton setBackgroundColor:[[UIColor greenColor] autorelease]];
    
    [self.acountButton setBackgroundImage:[UIImage imageNamed:@"signin.png"] forState:1];
    [self.acountButton setBackgroundImage:[UIImage imageNamed:@"signin.png"] forState:0];
    
    [self.acountButton addTarget:self action:@selector(setupAccount) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.acountButton];
    
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 350, 90, 27)];
    [self.cancelButton setBackgroundColor:[[UIColor greenColor] autorelease]];
    
    [self.cancelButton setBackgroundImage:[UIImage imageNamed:@"signup.png"] forState:0];
    [self.cancelButton setBackgroundImage:[UIImage imageNamed:@"signup.png"] forState:1];

    [self.cancelButton addTarget:self action:@selector(cancelAccount) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.cancelButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reload) name:@"update" object:nil];
    
    [self reload];
}

- (void) reload
{
    if ([[SSAccountAssitant sharedAccountAssitant] ifAccountExsit]) 
    {
        [self.acountButton setHidden:YES];
        [self.cancelButton setHidden:NO];
    }
    else
    {
        [self.acountButton setHidden:NO];
        [self.cancelButton setHidden:YES];
    }
}


- (void)setupAccount
{
    [self.accountDelegate setupAccount:self.pageControl.currentPage + 1];
    NSLog(@"setup Account");
}

- (void) cancelAccount
{
    [self.accountDelegate cancelAccount];
    NSLog(@"cancel Account");
}

#pragma - 
#pragma touch event - 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    startTouchPosition_ = [touch locationInView:self];
    self.dirString = NULL;
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currentTouchPosition = [touch locationInView:self];
    
#define HORIZ_SWIPE_DRAG_MIN 12
#define VERT_SWIPE_DRAG_MAX 4
    
    if (fabsf(startTouchPosition_.x - currentTouchPosition.x) >=
        HORIZ_SWIPE_DRAG_MIN &&
        fabsf(startTouchPosition_.y - currentTouchPosition.y) <=
        VERT_SWIPE_DRAG_MAX)  {
        // Horizontal Swipe
        if (startTouchPosition_.x < currentTouchPosition.x) {
            self.dirString = kCATransitionFromLeft;
        }
        else
        {
            self.dirString = kCATransitionFromRight;
        }

    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.dirString) [self swipeTo:self.dirString];
}


#pragma - 
#pragma aniamtion - 


- (void) swipeTo:(NSString *)string
{
    CATransition *transition;
    if ([string isEqualToString:kCATransitionFromLeft])
    {
        transition = [self getAnimation:string];
        [self.subView exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
        [self.subView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        
        if (self.pageControl.currentPage == 0) {
            [self.pageControl setCurrentPage:2];
        }
        else
        {
            [self.pageControl setCurrentPage:self.pageControl.currentPage - 1];
        }
    }
    
    else
    {
        transition = [self getAnimation:string];
        [self.subView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.subView exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
        
        if (self.pageControl.currentPage == 2) {
            [self.pageControl setCurrentPage:0];
        }
        else
        {
            [self.pageControl setCurrentPage:self.pageControl.currentPage + 1];
        }
    }
    
    [[self.subView.subviews objectAtIndex:0] setHidden:NO];
    [[self.subView.subviews objectAtIndex:1] setHidden:YES];
    [[self.subView.subviews objectAtIndex:2] setHidden:YES];
    [[self.subView layer] addAnimation:transition forKey:@"pageTurnAnimation"];

    NSLog(@"%d",self.pageControl.currentPage);
    
}

-(CATransition *) getAnimation:(NSString *) direction
{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:direction];
    [animation setDuration:1.0f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    return animation;
}
 
@end
