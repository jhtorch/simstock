//
//  SSCharacterView.h
//  SimStock
//
//  Created by Huo Ju on 12-5-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCharacterView : UIView
{
    UIImageView * image_;
    UILabel * name_;
    UILabel * money_;
    UILabel * description_;
}

@property (strong) UIImageView * image;
@property (strong) UILabel * name;
@property (strong) UILabel * money;
@property (strong) UILabel * description;

- (void)loadView;
@end
