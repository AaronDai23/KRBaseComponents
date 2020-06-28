//
//  KRWebView.m
//  kreditbro
//
//  Created by 戴培琼 on 2020/1/31.
//  Copyright © 2020 lai. All rights reserved.
//

#import "KRWebView.h"
#import <WebKit/WebKit.h>
#import "Masonry.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"

#define Baseurl1   @"http://47.88.222.67:9000"
#define banner_url1 @"/front/home/homeChart"

@interface KRWebView ()<WKNavigationDelegate>
{
    WKWebView       *_wkwebView;
    NSURLRequest    *_req;
}
@end

@implementation KRWebView
- (instancetype)init {
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _wkwebView = [[WKWebView alloc] init];
    
    [self addSubview:_wkwebView];
    _wkwebView.navigationDelegate = self;
    _req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Baseurl1,banner_url1]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.f];
    [_wkwebView loadRequest:_req];
    
    [_wkwebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    if (!_wkwebView.scrollView.mj_header.isRefreshing) {
        [SVProgressHUD showWithStatus:@"Loding..."];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
      [SVProgressHUD dismiss];
      [_wkwebView.scrollView.mj_header endRefreshing];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
