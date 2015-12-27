//
//  ViewController.m
//  10-CFBroadcastView
//
//  Created by 于传峰 on 15/12/27.
//  Copyright © 2015年 于传峰. All rights reserved.
//

#import "ViewController.h"
#import "CFBroadCastView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet CFBroadCastView *broadCastView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (CFBroadCastView *)broadCastView
{
    if (!_broadCastView) {
        CFBroadCastView* broadCastView = [[CFBroadCastView alloc] init];
        [self.videoView addSubview:broadCastView];
        broadCastView.frame = CGRectMake(0, 0, CGRectGetWidth(self.videoView.frame), 35);
        broadCastView.backgroundColor = [UIColor greenColor];
        
        broadCastView.textColor = [UIColor redColor];
        broadCastView.textFont = [UIFont boldSystemFontOfSize:17];
        broadCastView.scrollSpeed = 95;
        
        _broadCastView = broadCastView;
    }
    return _broadCastView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 1;
    [self.broadCastView fireBroadCast:[NSString stringWithFormat:@"系统提示：发送%zd条广播＝＝＝＝", i++]];
}

@end
