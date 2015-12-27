//
//  CFBroadCastView.h
//  10-CFBroadcastView
//
//  Created by 于传峰 on 15/12/27.
//  Copyright © 2015年 于传峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFBroadCastView : UIView
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) CGFloat scrollSpeed;
- (void)fireBroadCast:(NSString *)text;
@end
