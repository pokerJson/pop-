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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeContactAdd];
    bu.frame = CGRectMake(100, 400, 30, 40);
    [bu addTarget:self action:@selector(xx) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bu];
}
- (void)xx
{
    UIView *viviv = [[UIView alloc]initWithFrame:CGRectMake((kScreenWidht-260)/2, 0, 260, 300)];
    viviv.layer.cornerRadius = 10;
    viviv.layer.masksToBounds = YES;
    viviv.backgroundColor = [UIColor orangeColor];
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeCustom];
    bu.frame = CGRectMake(0, 100, 200, 40);
    [bu setTitle:@"dissmiss" forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(dismisssss) forControlEvents:UIControlEventTouchUpInside];
    [viviv addSubview:bu];
    [[DYY_AlertTool shared] show:viviv withType:DYYAlertStyleFromCenter];
    

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
