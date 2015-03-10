//
//  PinchAndRotationVC.m
//  UIGestureRecognizer
//
//  Created by hx_leichunxiang on 15-3-10.
//  Copyright (c) 2015年 leichunxiang. All rights reserved.
//  PinchAndRotationVC：双指手势,实现捏合与旋转识别器

#import "PinchAndRotationVC.h"

@interface PinchAndRotationVC ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation PinchAndRotationVC

{
    CGFloat scale,previousScale;
    CGFloat rotation,previousRotation;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    previousScale = 1;
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100, 260, 200)];
    self.imgView.image = [UIImage imageNamed:@"beauty@2x.jpg"];
    self.imgView.userInteractionEnabled = YES;
    [self.view addSubview:self.imgView];
    
    //双指捏合
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(doPinch:)];
    pinchGesture.delegate = self;
    [self.imgView addGestureRecognizer:pinchGesture];
    
    //双指旋转
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(doRotation:)];
    rotationGesture.delegate = self;
    [self.imgView addGestureRecognizer:rotationGesture];
    
}

#pragma mark - UIGestureRecognizerDelegate
//允许两个手势同时工作
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// 改变imgView的 尺寸或者旋转角度
- (void)transformImageView
{
    CGAffineTransform t = CGAffineTransformMakeScale(scale * previousScale, scale * previousScale);
    t = CGAffineTransformRotate(t, rotation + previousRotation);
    self.imgView.transform = t;
}


- (void)doPinch:(UIPinchGestureRecognizer *)gesture
{
    //scale 尺寸大小
    scale = gesture.scale;
    [self transformImageView];
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        previousScale = scale * previousScale;
        scale = 1;
    }
}

- (void)doRotation:(UIRotationGestureRecognizer *)gesture
{
    //rotation  旋转角度
    rotation = gesture.rotation;
    [self transformImageView];
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        previousRotation = rotation + previousRotation;
        rotation = 0;
    }
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
