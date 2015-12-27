//
//  CFBroadCastView.m
//  10-CFBroadcastView
//
//  Created by 于传峰 on 15/12/27.
//  Copyright © 2015年 于传峰. All rights reserved.
//

#import "CFBroadCastView.h"
@interface CFBroadCastView()
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, strong) NSMutableArray *textArray;

@end

@implementation CFBroadCastView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    UILabel* contentLabel = [[UILabel alloc] init];
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
}

- (NSMutableArray *)textArray
{
    if (!_textArray) {
        _textArray = [[NSMutableArray alloc] init];
    }
    return _textArray;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.contentLabel.textColor = textColor;
}
- (void)setTextFont:(UIFont *)textFont
{
    _textFont = textFont;
    self.contentLabel.font = textFont;
}

- (void)fireBroadCast:(NSString *)text
{
    [self.textArray addObject:text];
    if (self.textArray.count == 1) {
        [self playBroadCast];
    }
}

- (void)playBroadCast
{
    if (self.textArray.count == 0) {
        [self removeFromSuperview];
        return;
    }
    
    NSString* text = self.textArray[0];
    self.contentLabel.text = text;
    [self.contentLabel sizeToFit];
    CGRect beginFrame = self.contentLabel.frame;
    beginFrame.origin.x = CGRectGetMaxX(self.frame);
    beginFrame.origin.y = (CGRectGetHeight(self.frame) - beginFrame.size.height) * 0.5;
    self.contentLabel.frame = beginFrame;
    CGRect endFrame = beginFrame;
    endFrame.origin.x = - CGRectGetWidth(self.contentLabel.frame);
    NSTimeInterval duration = (CGRectGetWidth(self.frame) + CGRectGetWidth(self.contentLabel.frame)) * 1 / self.scrollSpeed;
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentLabel.frame = endFrame;
    } completion:^(BOOL finished) {
        [self.textArray removeObject:text];
        [self playBroadCast];
    }];
    
}


@end
