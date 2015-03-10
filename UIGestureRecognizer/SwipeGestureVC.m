//
//  SwipeGestureVC.m
//  UIGestureRecognizer
//
//  Created by hx_leichunxiang on 15-3-10.
//  Copyright (c) 2015年 leichunxiang. All rights reserved.
//  单指手势，实现左右上下滑动

#import "SwipeGestureVC.h"

@interface SwipeGestureVC ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGPoint gestureStartPoint;

@end

@implementation SwipeGestureVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 40)];
    _label.adjustsFontSizeToFitWidth = YES;
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    // 水平滑动
    UISwipeGestureRecognizer *vertical = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportVerticalSwipe:)];
    vertical.direction = UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:vertical];
    
    // 垂直滑动
    UISwipeGestureRecognizer *horizontal = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportHorizontalSwipe:)];
    horizontal.direction = UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:horizontal];
}

//清楚显示
- (void)eraseText
{
    self.label.text = @"";
}

//水平或垂直滑动 的触发事件
- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer
{
    self.label.text = @"Horizontal swipe detected";
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer
{
    self.label.text = @"Vertical swipe detected";
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

- (void)didReceiveMemoryWarning
{
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
