//
//  ViewController.m
//  pop动画
//
//  Created by dzc on 2018/6/11.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import "ViewController.h"
#import "DYY_AlertTool.h"
#define kScreenWidht [UIScreen mainScreen].bounds.size.width

@interface ViewController (){
}
@property (nonatomic,strong)UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _button= [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setBackgroundImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
    _button.frame = CGRectMake(100, 400, 40, 40);
    [_button addTarget:self action:@selector(xx) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}
- (void)xx
{
    [UIView transitionWithView:_button duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.button setBackgroundImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        [UIView transitionWithView:self.button duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [self.button setBackgroundImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
        } completion:^(BOOL finished) {
            UIView *viviv = [[UIView alloc]initWithFrame:CGRectMake((kScreenWidht-260)/2, 0, 260, 300)];
            viviv.layer.cornerRadius = 10;
            viviv.layer.masksToBounds = YES;
            viviv.backgroundColor = [UIColor orangeColor];
            UIButton *bu = [UIButton buttonWithType:UIButtonTypeCustom];
            bu.frame = CGRectMake(0, 100, 200, 40);
            [bu setTitle:@"dissmiss" forState:UIControlStateNormal];
            [bu addTarget:self action:@selector(dismisssss) forControlEvents:UIControlEventTouchUpInside];
            [viviv addSubview:bu];
            [[DYY_AlertTool shared] show:viviv withType:DYYAlertStyleFromBottom];
        }];
        
    }];
    

}
- (void)dismisssss
{
//    [[DYY_AlertTool shared] dismissToBottom];
    [[DYY_AlertTool shared] dismissToBottom];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
