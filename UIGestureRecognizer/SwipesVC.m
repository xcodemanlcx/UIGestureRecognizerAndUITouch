//
//  SwipesVC.m
//  UIGestureRecognizer
//
//  Created by hx_leichunxiang on 15-3-10.
//  Copyright (c) 2015年 leichunxiang. All rights reserved.
//  捕捉触控点，判断手势滑动方向.

#import "SwipesVC.h"
#define KMinGetureLength 25
#define KMaxVariance 5

@interface SwipesVC ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGPoint gestureStartPoint;

@end

@implementation SwipesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width/2, 40)];
    _label.adjustsFontSizeToFitWidth = YES;
    _label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_label];
}

//清楚显示
- (void)eraseText
{
    self.label.text = @"";
}

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.gestureStartPoint = [touch locationInView:self.view];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:self.view];
    
    CGFloat x = fabsf(self.gestureStartPoint.x - currentPosition.x);
    CGFloat y = fabsf(self.gestureStartPoint.y - currentPosition.y);
    
    //水平/垂直滑动
    if (x >= 25 && y <= 5) {
        
        self.label.text = @"Horizontal swipe detected";
        
        //2s后自动删除文本内容，便于检测下次滑动操作
        [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
    }else if (y >= 25 && x <= 5){
        
        self.label.text = @"Vertical swipe detected";
        
        [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
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
