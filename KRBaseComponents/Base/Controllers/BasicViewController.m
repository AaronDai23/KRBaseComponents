//
//  BasicViewController.m
//  SP2P_6.1
//
//  Created by 李小斌 on 14-6-6.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//



#import "BasicViewController.h"
#import <KRCommonComponents/Macros.h>
#import <KRCommonComponents/ColorTools.h>
#import <KRCommonComponents/FontTools.h>
#import "Masonry.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (instancetype)init{
    if (self = [super init]) {
        _bBack = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initNavigationBar];
}

- (void)initNavigationBar
{
    if (_bBack) {
        // 导航条返回按钮
        if (SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"10")) {
            self.view.backgroundColor = KbackgroundColor;
            self.navigationController.navigationBar.barTintColor = KRedColor;
            [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:KWhitekColor, NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18.0], NSFontAttributeName, nil]];
            self.left = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
            [self.left addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
            self.left.backgroundColor = KRClearColor;
            [self.left setTitle:@"" forState:UIControlStateNormal];
            [self.left setImage:KRIMAGE(@"nav_back") forState:UIControlStateNormal];
            
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:self.left];
            
            backItem.tintColor = KBlackColor;
            [self.navigationItem setLeftBarButtonItem:backItem];
        }else {
           self.left = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60,44)];
            [self.left setTitle:@"" forState:UIControlStateNormal];
            [self.left setImage:KRIMAGE(@"nav_back") forState:UIControlStateNormal];
            self.left.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [self.left addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.left];
            
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil action:nil];
            negativeSpacer.width = 0;
            [self.navigationItem setLeftBarButtonItems:@[negativeSpacer,leftItem]];
        }
        self.view.backgroundColor = KbackgroundColor;
        self.navigationController.navigationBar.barTintColor = KRedColor;
        [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:KWhitekColor, NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18.0], NSFontAttributeName, nil]];
      
    }
}


 
    //返回操作
- (void) backClick{
        id obj = [self.navigationController popViewControllerAnimated:YES];
        if (obj == nil) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
}

//新增右边导航按钮
- (void) addRightButton:(NSString *) title target:(nullable id)target action:(SEL)action {
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:self
                                                                               action:nil];
    flexSpacer.width = -10;
    
    //通用保存按钮
    UIButton *right = [UIButton buttonWithType:UIButtonTypeSystem];
    right.frame = CGRectMake(0, 0, 35, 44);
    [right setTitle:title forState:UIControlStateNormal];
    [right setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    right.titleLabel.textAlignment = NSTextAlignmentRight;
    right.titleLabel.font = KRFont(16);
    [right addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    CGRect frame = right.frame;
    frame.size.width = 35;
    right.frame = frame;
    right.backgroundColor = [UIColor clearColor];
    [self.navigationItem setRightBarButtonItems:@[flexSpacer,[[UIBarButtonItem alloc] initWithCustomView:right]]];
    
}

// 设置状态栏背景颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    if (color == nil) {
        color = UIColor.blackColor;
    }
   if (@available(iOS 13.0, *)) {
           UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame] ;
            statusBar.backgroundColor = color;
            [[UIApplication sharedApplication].keyWindow addSubview:statusBar];
        } else {
            // Fallback on earlier versions
            UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
               if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
                   statusBar.backgroundColor = color;
               }
        }
}

@end
