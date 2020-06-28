//
//  WebVC+ChangeHeight.m
//  kreditbro
//
//  Created by 戴培琼 on 2020/1/6.
//  Copyright © 2020 lai. All rights reserved.
//

#import "WebVC+ChangeHeight.h"
#import "Masonry.h"

@implementation WebVC (ChangeHeight)
- (void)updateWebViewConstraints{
    [_webView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}
@end
