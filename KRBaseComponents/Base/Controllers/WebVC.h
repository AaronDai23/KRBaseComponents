//
//  WebVC.h
//  kreditbro
//
//  Created by 戴培琼 on 2019/3/30.
//  Copyright © 2019 lai. All rights reserved.
//

#import "BasicViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebVC : BasicViewController
{
    WKWebView       *_webView;
    NSURLRequest    *_req;
}
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *html;
/// no 就是url加载 yes 就是html
@property (nonatomic, assign) BOOL type;
@end

NS_ASSUME_NONNULL_END
