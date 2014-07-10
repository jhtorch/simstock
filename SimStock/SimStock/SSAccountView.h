//
//  SSAccountView.h
//  SimStock
//
//  Created by Huo Ju on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSAccountView : UIView
{
    UILabel * name_;
    UILabel * job_;
    UIImageView * image_;
    UILabel * text1_;
    UILabel * text2_;
    UILabel * text3_;
    UILabel * text4_;
}
@property (strong) UILabel * name;
@property (strong) UILabel * job;
@property (strong) UILabel * text1;
@property (strong) UILabel * text2;
@property (strong) UILabel * text3;
@property (strong) UILabel * text4;
@property (strong) UIImageView * image;

- (void) loadView;

@end
