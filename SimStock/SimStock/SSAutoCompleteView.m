//
//  SSAutoCompleteView.m
//  SimStock
//
//  Created by Huo Ju on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SSAutoCompleteView.h"

@implementation SSAutoCompleteView


#pragma - 
#pragma touch event - 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    startTouchPosition_ = [touch locationInView:self];
    //self.dirString = NULL;
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
           // self.dirString = kCATransitionFromLeft;
            CATransition *animation = [CATransition animation]; 
            animation.duration = 1.25f; 
            animation.timingFunction = UIViewAnimationCurveEaseInOut; 
            animation.fillMode = kCAFillModeForwards; 
            animation.type = kCATransitionPush; 
            animation.subtype = kCATransitionFromLeft; 
            [self.superview.layer addAnimation:animation forKey:@"animation"]; 
            [self removeFromSuperview]; 
        }
        else
        {
           // self.dirString = kCATransitionFromRight;
        }
        
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  //  if (self.dirString) [self swipeTo:self.dirString];
}
@end
