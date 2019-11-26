//
//  ViewController.m
//  WKWebViewRequestHook
//
//  Created by admin on 2019/11/23.
//  Copyright © 2019 sunzhongliang. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"163";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.wkWebView];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.163.com"]];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    [self.wkWebView loadRequest:request];
}

- (WKWebView *)wkWebView {
    if (!_wkWebView) {
        //创建WKWebview
        WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc] init];
        _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        _wkWebView.navigationDelegate = self;
    }
    return _wkWebView;
}


- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    NSLog(@"----------%@", navigationAction);
    decisionHandler(WKNavigationActionPolicyAllow);
}


@end
