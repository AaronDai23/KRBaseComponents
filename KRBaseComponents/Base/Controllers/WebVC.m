//
//  WebVC.m
//  kreditbro
//
//  Created by 戴培琼 on 2019/3/30.
//  Copyright © 2019 lai. All rights reserved.
//

#import "WebVC.h"
#import "Masonry.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"

@interface WebVC ()<WKNavigationDelegate>

@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void) initView {
    
    _webView = [[WKWebView alloc] init];
     [self.view addSubview:_webView];
    _webView.navigationDelegate = self;
    _req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.f];
    [_webView loadRequest:_req];
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
   
    //刷新
    if (!self.type) {
        _webView.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [_webView loadRequest:_req];
            
        }];
    }else {
        if (_html) {
            [_webView loadHTMLString:_html baseURL:nil];
        }
    }
}

- (void)setHtml:(NSString *)html {
    _html = html;
    if (html) {
         [_webView loadHTMLString:_html baseURL:nil];
    }
}


- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    if (!_webView.scrollView.mj_header.isRefreshing) {
        [SVProgressHUD showWithStatus:@"Loding..."];
        //        [SVProgressHUD showWithStatus:@"Loading..."];
        
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
      [SVProgressHUD dismiss];;
      [_webView.scrollView.mj_header endRefreshing];
}


- (void)backClick {
    [super backClick];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
