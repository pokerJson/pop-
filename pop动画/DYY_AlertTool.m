//
//  DYY_AlertTool.m
//  pop动画
//
//  Created by dzc on 2018/6/11.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import "DYY_AlertTool.h"
#import <pop/POP.h>
#define kScreenWidht [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define KEYWINDOW     [[UIApplication sharedApplication] keyWindow]
#define weakObj(o)      __weak    typeof(o) o##Weak = o

@interface DYY_AlertTool()

/**
 
 */
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)CALayer *maskLayer;
@property (nonatomic, strong) UIControl *control;

@end

@implementation DYY_AlertTool

+ (DYY_AlertTool *)shared{
    static DYY_AlertTool *alertViewTool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!alertViewTool) {
            alertViewTool = [[DYY_AlertTool alloc] init];
        }
    });
    return alertViewTool;
}
- (void)show:(UIView *)contentView withType:(DYYAlertStyle)style
{
    [self addMaskLayer];
    self.contentView = contentView;
    [self.contentView pop_removeAllAnimations];
    if (style == DYYAlertStyleFromTop)
    {
        [self showFromTop];
    }else if(style == DYYAlertStyleFromCenter)
    {
        [self showFromCenter];
    }else if (style == DYYAlertStyleFromLeft)
    {
        [self showFromLeft];

    }
}
- (void)showFromTop
{
    //1旋转初始值
    CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI_4/8);
    [self.contentView.layer setAffineTransform:rotation];
    //2 改变y值
    POPSpringAnimation *anmationY = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anmationY.springSpeed = 12;
    anmationY.springBounciness = 12;
    anmationY.fromValue = @(-self.contentView.frame.size.height/2);//
    anmationY.toValue = @(kScreenHeight/2);
    //3
    POPBasicAnimation *opacityAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacityAnim.duration = 0.25;
    opacityAnim.toValue = @1.0;
    //4 旋转到0
    POPBasicAnimation *rotationAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotationAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnim.beginTime = CACurrentMediaTime() + 0.1;
    rotationAnim.duration = 0.3;
    rotationAnim.toValue = @(0);
    //5 放大缩小
    POPBasicAnimation *scaleToBig = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleToBig.beginTime = CACurrentMediaTime() + 0.1;
    scaleToBig.duration = 0.3;
    scaleToBig.toValue = [NSValue valueWithCGSize:CGSizeMake(1.2, 1.2)];
    //6放大缩小
    POPBasicAnimation *sclaeToOrig = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    sclaeToOrig.beginTime = CACurrentMediaTime() + 0.4;
    sclaeToOrig.duration = 0.3;
    sclaeToOrig.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    
    [self.contentView.layer pop_addAnimation:anmationY forKey:@"AnimationScale"];
    [self.contentView.layer pop_addAnimation:opacityAnim forKey:@"AnimateOpacity"];
    [self.contentView.layer pop_addAnimation:rotationAnim forKey:@"AnimateRotation"];
    [self.contentView.layer pop_addAnimation:scaleToBig forKey:@"AnimateRotation2"];
    [self.contentView.layer pop_addAnimation:sclaeToOrig forKey:@"AnimateRotation23"];
    
    [KEYWINDOW addSubview:self.contentView];

}
- (void)showFromCenter
{
    [self.contentView.layer pop_removeAllAnimations];
    POPSpringAnimation *spinga = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    spinga.springBounciness = 20;
    spinga.springSpeed = 10;
    spinga.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    spinga.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    POPBasicAnimation *opacityAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacityAnim.duration = 0.3;
    opacityAnim.toValue = @1.0;
    

    [self.contentView.layer pop_addAnimation:spinga forKey:@"spinga"];
    [self.contentView.layer pop_addAnimation:opacityAnim forKey:@"opacityAnim"];
    
    self.contentView.center = KEYWINDOW.center;
    [KEYWINDOW addSubview:self.contentView];

}
- (void)showFromLeft
{
    POPSpringAnimation *leftSprong = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    leftSprong.springSpeed = 12;
    leftSprong.springBounciness = 20;
    leftSprong.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    leftSprong.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    [self.contentView.layer pop_addAnimation:leftSprong forKey:@"lefta"];
    
    POPSpringAnimation *leftSprong2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    leftSprong2.springSpeed = 12;
    leftSprong2.springBounciness = 20;
    leftSprong2.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, KEYWINDOW.center.y)];
    leftSprong2.toValue =  [NSValue valueWithCGPoint:CGPointMake(KEYWINDOW.center.x, KEYWINDOW.center.y)];
    [self.contentView.layer pop_addAnimation:leftSprong2 forKey:@"lefta2"];

    
    
    [KEYWINDOW addSubview:self.contentView];

}
- (void)dismissToBottom
{
//    weakObj(self);
//    POPSpringAnimation *springAn = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    springAn.springBounciness = 18;
//    springAn.springSpeed = 12;
//    springAn.toValue = @(kScreenHeight/2-60);
//    springAn.completionBlock = ^(POPAnimation *anim, BOOL finished) {
//        POPBasicAnimation *anmationY = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//        anmationY.beginTime = CACurrentMediaTime();
//        anmationY.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        anmationY.duration = 0.3;
//        anmationY.fromValue = @(kScreenHeight/2-60);
//        anmationY.toValue = @(kScreenHeight+self.contentView.frame.size.height);
//        [self.contentView.layer pop_addAnimation:anmationY forKey:@"anmationY"];
//        anmationY.completionBlock = ^(POPAnimation *anim, BOOL finished) {
//            [selfWeak dismiss];
//        };
//    };
//    [self.contentView.layer pop_addAnimation:springAn forKey:@"springAn"];
    
    //默认是0.4秒的动画 左右抖动
    POPSpringAnimation *spin = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    spin.springBounciness = 20;
    spin.springSpeed = 1;
    spin.fromValue = @(0.2);
    spin.fromValue = @(-0.2);
    [self.contentView.layer pop_addAnimation:spin forKey:@"spim"];
    
    weakObj(self);
    POPBasicAnimation *anmationY = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anmationY.beginTime = CACurrentMediaTime();
    anmationY.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anmationY.duration = 0.3;
    anmationY.beginTime = CACurrentMediaTime()+0.4;//这里延迟0.4秒执行 就是等上一个动画完成再执行  也可以用上一个动画的block里面执行就不用延迟0.4秒了
    anmationY.fromValue = @(kScreenHeight/2);
    anmationY.toValue = @(kScreenHeight+self.contentView.frame.size.height);
    [self.contentView.layer pop_addAnimation:anmationY forKey:@"anmationY"];
    anmationY.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        [selfWeak.contentView removeFromSuperview];
        [selfWeak dismiss];
    };
    [self.contentView.layer pop_addAnimation:anmationY forKey:@"sss"];

}
- (void)dismissToCenter
{
    weakObj(self);
    POPSpringAnimation *dismistoCenter = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    dismistoCenter.toValue = [NSValue valueWithCGPoint:CGPointMake(1.1, 1.1)];
    dismistoCenter.springSpeed = 20;
    dismistoCenter.springBounciness = 20;//z最大阻尼 
    dismistoCenter.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        POPSpringAnimation *dismistoCenter2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        dismistoCenter2.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
        dismistoCenter2.springSpeed = 20;
        dismistoCenter2.springBounciness = 0;//没有阻尼
        [self.contentView.layer pop_addAnimation:dismistoCenter2 forKey:@"tocenter2"];
        dismistoCenter2.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            [selfWeak dismiss];
        };

    };
    [self.contentView.layer pop_addAnimation:dismistoCenter forKey:@"tocenter"];
    
    
}
- (void)dismissToCenter2
{
    weakObj(self);
    POPSpringAnimation *rotationAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    rotationAnimation.springBounciness = 6;
    rotationAnimation.springSpeed = 20;
    rotationAnimation.toValue = @(-1.5700);
    [self.contentView.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    rotationAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        [selfWeak.contentView removeFromSuperview];
        [selfWeak dismiss];
    };

}
- (void)dismissToRight
{
    weakObj(self);
    POPBasicAnimation *rightBounds = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerBounds];
    rightBounds.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    [self.contentView.layer pop_addAnimation:rightBounds forKey:@"rightBounds"];
    
    POPBasicAnimation *righta = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    righta.toValue =  [NSValue valueWithCGPoint:CGPointMake(kScreenWidht, KEYWINDOW.center.y)];
    [self.contentView.layer pop_addAnimation:righta forKey:@"righta"];
    righta.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        [selfWeak.contentView removeFromSuperview];
        [selfWeak dismiss];
    };

}
- (void)addMaskLayer
{
    _maskLayer = [CALayer layer];
    [_maskLayer setFrame:[[UIScreen mainScreen] bounds]];
    [_maskLayer setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.80].CGColor];
    [[KEYWINDOW layer] addSublayer:_maskLayer];
    //判断关闭方式
//    [self setCloseStyle:_closeStyle];
//    [KEYWINDOW addSubview:self.control];
    
}
- (UIControl *)control{
    
    if(!_control){
        
        _control = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        [_control addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        _control.enabled = NO;
    }
    return _control;
}
- (void)dismiss
{
    if (_maskLayer) {
        [_maskLayer removeFromSuperlayer];
        [_control removeFromSuperview];
        _maskLayer = nil;
        _control = nil;
    }
    
}

@end
