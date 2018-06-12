//
//  DYY_AlertTool.h
//  pop动画
//
//  Created by dzc on 2018/6/11.
//  Copyright © 2018年 dyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

///弹窗模式
typedef enum{
    ///默认 从窗口正中 弹出
    DYYAlertStyleFromCenter = 0,
    ///下
    DYYAlertStyleFromBottom,
    ///上
    DYYAlertStyleFromTop,
    ///左
    DYYAlertStyleFromLeft,
    ///右边
    DYYAlertStyleFromRight,
    
}DYYAlertStyle;

@interface DYY_AlertTool : NSObject

+ (DYY_AlertTool *)shared;

- (void)show:(UIView *)contentView withType:(DYYAlertStyle)style;
- (void)dismissToBottom;
- (void)dismissToCenter;
- (void)dismissToCenter2;
- (void)dismissToRight;

@end
