//
//  BasicViewController.h
//  SP2P_6.1
//
//  Created by 李小斌 on 14-6-6.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//

/**
 *  ViewController的父类，用来做通用性调整
 */
#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController
@property (nonatomic,strong) NSString   * _Nullable viewId;
@property (nonatomic,assign) BOOL        bBack; //是否是返回视图  默认YES

@property (nonatomic,strong) UIButton * _Nullable left;
//新增右边导航按钮
- (void) addRightButton:(NSString *) title target:(nullable id)target action:(SEL)action;

//返回操作
- (void)backClick;

// 设置状态栏背景颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color;
@end
