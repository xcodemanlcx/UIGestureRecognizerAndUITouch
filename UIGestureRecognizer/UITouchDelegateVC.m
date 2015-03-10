//
//  UITouchDelegateVC.m
//  UIGestureRecognizer
//
//  Created by hx_leichunxiang on 15-3-10.
//  Copyright (c) 2015年 leichunxiang. All rights reserved.
//  触控点的代理方法

#import "UITouchDelegateVC.h"

@interface UITouchDelegateVC ()

@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UILabel *tapsLabel;
@property (nonatomic, strong) UILabel *touchesLabel;

@end

@implementation UITouchDelegateVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //开启多点触控
    self.view.multipleTouchEnabled = YES;
    
    [self initView];
}

//msg、tap、touches
- (void)initView
{
    //
    _msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    _msgLabel.backgroundColor = [UIColor clearColor];
    _msgLabel.font = [UIFont systemFontOfSize:17];
    _msgLabel.textColor = [UIColor redColor];
    _msgLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_msgLabel];
    
    _tapsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100+80, self.view.frame.size.width, 60)];
    [self.view addSubview:_tapsLabel];
    
    _touchesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100+80+80, self.view.frame.size.width, 60)];
    [self.view addSubview:_touchesLabel];
}

//更新touches的内容
- (void)updateLabelsFromTouches:(NSSet *)touches
{
    //tap 轻拍次数
    NSUInteger numTaps = [[touches anyObject] tapCount];
    NSString *tapMsg = [NSString stringWithFormat:@"%d taps detected",numTaps];
    _tapsLabel.text = tapMsg;
    
    //touches  触碰点个数
    NSUInteger numTouches = [touches count];
    NSString *touchMsg = [NSString stringWithFormat:@"%d touches detected",numTouches];
    _touchesLabel.text = touchMsg;
    
}

//跟踪下UIEvent的方法

//touch的代理方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.msgLabel.text = @"touchesBegan";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{//被电话呼入等事件中断取消时调用
    self.msgLabel.text = @"touchesCancell";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.msgLabel.text = @"touchesEnded";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.msgLabel.text = @"touchesMoved";
    [self updateLabelsFromTouches:touches];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
