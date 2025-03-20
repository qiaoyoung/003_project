//
//  ZMONAccountPolicyViewController.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/8.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import "ZMONAccountPolicyViewController.h"
#import <WebKit/WebKit.h>

@interface ZMONAccountPolicyViewController ()<WKNavigationDelegate, WKUIDelegate>

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation ZMONAccountPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        bg.image = [UIImage imageNamed:@"login_bg"];
        [self.view addSubview:bg];

    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.selectionGranularity = WKSelectionGranularityDynamic;
    config.allowsPictureInPictureMediaPlayback = YES;
    WKPreferences *preferences = [WKPreferences new];
    //是否支持JavaScript
    preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
    preferences.javaScriptCanOpenWindowsAutomatically = NO;
    config.preferences = preferences;
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_TOP_HEIGHT) configuration:config];
    _webView.backgroundColor = [UIColor clearColor];
    _webView.scrollView.backgroundColor = [UIColor clearColor];
    _webView.opaque = NO;
    [self.view addSubview:_webView];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.backgroundColor = [UIColor clearColor];
    [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(15, 5+SCREEN_STATUS_HEIGHT, 40, 40);
    

    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, SCREEN_STATUS_HEIGHT, 100, 83)];
    img.image = [UIImage imageNamed:@"webview_icon"];
    [self.view addSubview:img];
    
    [self reloadWebView];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (void)reloadWebView{
    NSString *path = self.urlString;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        path = [[NSBundle mainBundle] pathForResource:self.urlString ofType:nil];
    }
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
}

#pragma mark - WKNavigationDelegate
/* 页面开始加载 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}

/* 开始返回内容 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

/* 页面加载完成 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

}

/* 页面加载失败 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{

}




@end
