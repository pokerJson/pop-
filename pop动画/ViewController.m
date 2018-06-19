//
//  ViewController.m
//  pop动画
//
//  Created by dzc on 2018/6/11.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import "ViewController.h"
#import "DYY_AlertTool.h"
#import <pop/POP.h>

#define kScreenWidht [UIScreen mainScreen].bounds.size.width

@interface ViewController (){
    UIView *_view1;
    UIView *_view2;
    
    UIButton *_button1;
    UIButton *_button2;
    UIButton *_button3;
    UIButton *_button4;
    UIButton *_button5;
    UIButton *_button6;
    NSMutableArray *_buttonARRR;


}
@property (nonatomic,strong)UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1弹窗
    _button= [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setBackgroundImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
    _button.frame = CGRectMake(100, 400, 40, 40);
    [_button addTarget:self action:@selector(xx) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    
    //2 uiview自带的转场动画
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeContactAdd];
    bu.frame = CGRectMake(200, 400, 40, 40);
    [self.view addSubview:bu];
    [bu addTarget:self action:@selector(xxxxxxx) forControlEvents:UIControlEventTouchUpInside];

    UIView *bav = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 200, 260)];
    bav.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bav];
    
    _view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 260)];
    _view1.backgroundColor = [UIColor orangeColor];
    _view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 260)];
    _view2.backgroundColor = [UIColor redColor];
    [bav addSubview:_view2];
    [bav addSubview:_view1];
    
    
    ///3
    _buttonARRR = [[NSMutableArray alloc]init];
    
    UIButton *bu2222 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    bu2222.frame = CGRectMake(200, 500, 40, 40);
    [self.view addSubview:bu2222];
    [bu2222 addTarget:self action:@selector(xxxxxxx2222) forControlEvents:UIControlEventTouchUpInside];
    NSArray *arr = [NSArray arrayWithObjects:@"camera",@"music",@"plcae",@"sleep",@"thought", nil];
    for (int i =0; i<arr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 0, 0);
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        bu.tag = 100+i;
        button.center = bu2222.center;
        [_buttonARRR addObject:button];
    }
//    _button1= [UIButton buttonWithType:UIButtonTypeCustom];
//    [_button1 setBackgroundColor:[UIColor redColor]];
//    _button1.layer.masksToBounds = YES;
//    _button1.layer.cornerRadius = 15;
//    _button1.frame = CGRectMake(0, 0, 30, 30);
//    _button1.center = bu2222.center;
//
//    _button2= [UIButton buttonWithType:UIButtonTypeCustom];
//    [_button2 setBackgroundColor:[UIColor orangeColor]];
//    _button2.layer.masksToBounds = YES;
//    _button2.layer.cornerRadius = 15;
//    _button2.frame = CGRectMake(0, 0, 30, 30);
//    _button2.center = bu2222.center;
//
//    _button3= [UIButton buttonWithType:UIButtonTypeCustom];
//    [_button3 setBackgroundColor:[UIColor yellowColor]];
//    _button3.layer.masksToBounds = YES;
//    _button3.layer.cornerRadius = 15;
//    _button3.frame = CGRectMake(0, 0, 30, 30);
//    _button3.center = bu2222.center;
//
//    _button4= [UIButton buttonWithType:UIButtonTypeCustom];
//    [_button4 setBackgroundColor:[UIColor blueColor]];
//    _button4.layer.masksToBounds = YES;
//    _button4.layer.cornerRadius = 15;
//    _button4.frame = CGRectMake(0, 0, 30, 30);
//    _button4.center = bu2222.center;
//
//    _button5= [UIButton buttonWithType:UIButtonTypeCustom];
//    [_button5 setBackgroundColor:[UIColor blackColor]];
//    _button5.layer.masksToBounds = YES;
//    _button5.layer.cornerRadius = 15;
//    _button5.frame = CGRectMake(0, 0, 30, 30);
//    _button5.center = bu2222.center;
//
//    _button6= [UIButton buttonWithType:UIButtonTypeCustom];
//    [_button6 setBackgroundColor:[UIColor greenColor]];
//    _button6.layer.masksToBounds = YES;
//    _button6.layer.cornerRadius = 15;
//    _button6.frame = CGRectMake(0, 0, 30, 30);
//    _button6.center = bu2222.center;
    
//    [_buttonARRR addObject:_button1];
//    [_buttonARRR addObject:_button2];
//    [_buttonARRR addObject:_button3];
//    [_buttonARRR addObject:_button4];
//    [_buttonARRR addObject:_button5];
//    [_buttonARRR addObject:_button6];


}
- (void)buttonclick:(UIButton *)but
{
    NSLog(@"but.tag==%ld",(long)but.tag);
    for (int i = 0; i<_buttonARRR.count; i++) {
        UIButton *button = _buttonARRR[_buttonARRR.count-1-i];//从最底下那个开始
        
        POPBasicAnimation *rotaion = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
        rotaion.toValue = @(M_PI*2);
        rotaion.beginTime = CACurrentMediaTime() + 0.1*i;//延迟   //注释和不注释效果不一样
        rotaion.repeatCount = 1;
        NSString *key4 = [NSString stringWithFormat:@"rotaion%d",i];
        [button.layer pop_addAnimation:rotaion forKey:key4];

        POPBasicAnimation *opp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerSize];
        opp.fromValue = [NSValue valueWithCGSize:CGSizeMake(30, 30)];
        opp.toValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
        opp.beginTime = CACurrentMediaTime() + 0.1*i;//延迟
        NSString *key = [NSString stringWithFormat:@"kPOPLayerScaleXY%d",i];
        [button.layer pop_addAnimation:opp forKey:key];
        
        POPBasicAnimation *opp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        opp1.toValue = @500;//起始位置
        opp1.fromValue = @(500-i*40);
        opp1.beginTime = CACurrentMediaTime() + 0.1*i;
        NSString *key2 = [NSString stringWithFormat:@"kPOPLayerPositionY%d",i];
        [button.layer pop_addAnimation:opp1 forKey:key2];
        
        POPBasicAnimation *ooo = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        ooo.fromValue = @1;
        ooo.toValue = @0;
        ooo.beginTime = CACurrentMediaTime() + 0.1*i;
        NSString *key3 = [NSString stringWithFormat:@"kPOPLayerOpacity%d",i];
        [button.layer pop_addAnimation:ooo forKey:key3];
        
        
        [self.view addSubview:button];
    }

}
- (void)xxxxxxx2222
{
    for (int i = 0; i<_buttonARRR.count; i++) {
        UIButton *button = _buttonARRR[i];
        POPBasicAnimation *opp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerSize];
        opp.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
        opp.toValue = [NSValue valueWithCGSize:CGSizeMake(30, 30)];
        opp.beginTime = CACurrentMediaTime() + 0.1*i;//延迟
        NSString *key = [NSString stringWithFormat:@"kPOPLayerScaleXY%d",i];
        [button.layer pop_addAnimation:opp forKey:key];
        
        POPBasicAnimation *opp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        opp1.fromValue = @500;//起始位置
        opp1.toValue = @(500-(_buttonARRR.count-i)*40);
        opp1.beginTime = CACurrentMediaTime() + 0.1*i;
        NSString *key2 = [NSString stringWithFormat:@"kPOPLayerPositionY%d",i];
        [button.layer pop_addAnimation:opp1 forKey:key2];
        
        POPBasicAnimation *ooo = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        ooo.fromValue = @0;
        ooo.toValue = @1;
        NSString *key3 = [NSString stringWithFormat:@"kPOPLayerOpacity%d",i];
        [button.layer pop_addAnimation:ooo forKey:key3];


        [self.view addSubview:button];
    }
//    POPBasicAnimation *opp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    opp.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    opp.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
//    opp.duration = 0.4;
//    [_button1.layer pop_addAnimation:opp forKey:@"opp"];
//    POPBasicAnimation *opp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    opp1.fromValue = @500;
//    opp1.toValue = @(500-6*40);
//    opp1.duration = 0.4;
//    [_button1.layer pop_addAnimation:opp1 forKey:@"opp1"];
//    [self.view addSubview:_button1];
//
//    POPBasicAnimation *oppp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    oppp.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    oppp.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
//    oppp.beginTime = CACurrentMediaTime() + 0.1;
//    [_button2.layer pop_addAnimation:oppp forKey:@"oppp"];
//    oppp.duration = 0.4;
//    POPBasicAnimation *oppp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    oppp1.fromValue = @500;
//    oppp1.toValue = @(500-5*40);
//    oppp1.beginTime = CACurrentMediaTime() + 0.1;
//    oppp1.duration = 0.4;
//    [_button2.layer pop_addAnimation:oppp1 forKey:@"oppp1"];
//    [self.view addSubview:_button2];
//
//    POPBasicAnimation *opppp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    opppp.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    opppp.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
//    opppp.beginTime = CACurrentMediaTime() + 0.2;
//    [_button3.layer pop_addAnimation:opppp forKey:@"opppp"];
//    opppp.duration = 0.4;
//    POPBasicAnimation *opppp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    opppp1.fromValue = @500;
//    opppp1.toValue = @(500-4*40);
//    opppp1.beginTime = CACurrentMediaTime() + 0.2;
//    opppp1.duration = 0.4;
//    [_button3.layer pop_addAnimation:opppp1 forKey:@"opppp1"];
//    [self.view addSubview:_button3];
//
//    POPBasicAnimation *oppppp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    oppppp.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    oppppp.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
//    oppppp.beginTime = CACurrentMediaTime() + 0.3;
//    [_button4.layer pop_addAnimation:oppppp forKey:@"oppppp"];
//    oppppp.duration = 0.4;
//    POPBasicAnimation *oppppp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    oppppp1.fromValue = @500;
//    oppppp1.toValue = @(500-3*40);
//    oppppp1.beginTime = CACurrentMediaTime() + 0.3;
//    oppppp1.duration = 0.4;
//    [_button4.layer pop_addAnimation:oppppp1 forKey:@"oppppp1"];
//    [self.view addSubview:_button4];
//
//    POPBasicAnimation *opppppp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    opppppp.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    opppppp.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
//    opppppp.beginTime = CACurrentMediaTime() + 0.4;
//    [_button5.layer pop_addAnimation:opppppp forKey:@"opppppp"];
//    oppppp.duration = 0.4;
//    POPBasicAnimation *opppppp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    opppppp1.fromValue = @500;
//    opppppp1.toValue = @(500-2*40);
//    opppppp1.beginTime = CACurrentMediaTime() + 0.4;
//    opppppp1.duration = 0.4;
//    [_button5.layer pop_addAnimation:opppppp1 forKey:@"opppppp1"];
//    [self.view addSubview:_button5];
//
//    POPBasicAnimation *oppppppp = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    oppppppp.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    oppppppp.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
//    oppppppp.beginTime = CACurrentMediaTime() + 0.5;
//    [_button6.layer pop_addAnimation:oppppppp forKey:@"oppppppp"];
//    oppppppp.duration = 0.4;
//    POPBasicAnimation *oppppppp1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    oppppppp1.fromValue = @500;
//    oppppppp1.toValue = @(500-1*40);
//    oppppppp1.beginTime = CACurrentMediaTime() + 0.5;
//    oppppppp1.duration = 0.4;
//    [_button6.layer pop_addAnimation:oppppppp1 forKey:@"oppppppp1"];
//    [self.view addSubview:_button6];
//


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
- (void)xxxxxxx
{
    [UIView transitionFromView:_view1 toView:_view2 duration:1 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
        [UIView transitionFromView:_view2 toView:_view1 duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
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
