
#import <Foundation/Foundation.h>
typedef struct {
    Byte lengthShouldFlavor;
    Byte *cameraData;
    unsigned int fileConcerning;
    bool displace;
	int mutualDepressed;
} CountDateData;

NSString *StringFromCountDateData(CountDateData *data);


//: login_bg
CountDateData str_byKeyValue = (CountDateData){82, (Byte []){62, 61, 53, 59, 60, 13, 48, 53, 153}, 8, false, 72};


//: back_arrow_bl
CountDateData str_modelWidowData = (CountDateData){129, (Byte []){227, 224, 226, 234, 222, 224, 243, 243, 238, 246, 222, 227, 237, 121}, 13, false, 48};


//: webview_icon
CountDateData str_weaponText = (CountDateData){167, (Byte []){208, 194, 197, 209, 206, 194, 208, 248, 206, 196, 200, 201, 166}, 12, false, 73};

// __DEBUG__
// __CLOSE_PRINT__
//
//  AverageViewController.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/8.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONAccountPolicyViewController.h"
#import "AverageViewController.h"
//: #import <WebKit/WebKit.h>
#import <WebKit/WebKit.h>

//: @interface ZMONAccountPolicyViewController ()<WKNavigationDelegate, WKUIDelegate>
@interface AverageViewController ()<WKNavigationDelegate, WKUIDelegate>

//: @property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) WKWebView *webView;
//: @property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *closeBtn;

//: @end
@end

//: @implementation ZMONAccountPolicyViewController
@implementation AverageViewController

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];

        //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        //: bg.image = [UIImage imageNamed:@"login_bg"];
        bg.image = [UIImage imageNamed:StringFromCountDateData(&str_byKeyValue)];
        //: [self.view addSubview:bg];
        [self.view addSubview:bg];


    //: WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    //: config.selectionGranularity = WKSelectionGranularityDynamic;
    config.selectionGranularity = WKSelectionGranularityDynamic;
    //: config.allowsPictureInPictureMediaPlayback = YES;
    config.allowsPictureInPictureMediaPlayback = YES;
    //: WKPreferences *preferences = [WKPreferences new];
    WKPreferences *preferences = [WKPreferences new];
    //是否支持JavaScript
    //: preferences.javaScriptEnabled = YES;
    preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
    //: preferences.javaScriptCanOpenWindowsAutomatically = NO;
    preferences.javaScriptCanOpenWindowsAutomatically = NO;
    //: config.preferences = preferences;
    config.preferences = preferences;

    //: _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - (44.0f + [UIDevice vg_statusBarHeight])) configuration:config];
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - (44.0f + [UIDevice task])) configuration:config];
    //: _webView.backgroundColor = [UIColor clearColor];
    _webView.backgroundColor = [UIColor clearColor];
    //: _webView.scrollView.backgroundColor = [UIColor clearColor];
    _webView.scrollView.backgroundColor = [UIColor clearColor];
    //: _webView.opaque = NO;
    _webView.opaque = NO;
    //: [self.view addSubview:_webView];
    [self.view addSubview:_webView];
    //: _webView.navigationDelegate = self;
    _webView.navigationDelegate = self;
    //: _webView.UIDelegate = self;
    _webView.UIDelegate = self;

    //: self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: self.closeBtn.backgroundColor = [UIColor clearColor];
    self.closeBtn.backgroundColor = [UIColor clearColor];
    //: [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [self.closeBtn setImage:[UIImage imageNamed:StringFromCountDateData(&str_modelWidowData)] forState:(UIControlStateNormal)];
    //: [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.closeBtn addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [self.view addSubview:self.closeBtn];
    [self.view addSubview:self.closeBtn];
    //: self.closeBtn.frame = CGRectMake(15, 5+[UIDevice vg_statusBarHeight], 40, 40);
    self.closeBtn.frame = CGRectMake(15, 5+[UIDevice task], 40, 40);


    //: UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-100, [UIDevice vg_statusBarHeight], 100, 83)];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-100, [UIDevice task], 100, 83)];
    //: img.image = [UIImage imageNamed:@"webview_icon"];
    img.image = [UIImage imageNamed:StringFromCountDateData(&str_weaponText)];
    //: [self.view addSubview:img];
    [self.view addSubview:img];

    //: [self reloadWebView];
    [self bubble];
}

//: - (void)backAction{
- (void)withItem{
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: -(void)viewWillAppear:(BOOL)animated{
-(void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBarHidden = YES;
}


//: - (void)reloadWebView{
- (void)bubble{
    //: NSString *path = self.urlString;
    NSString *path = self.urlString;
    //: if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        //: path = [[NSBundle mainBundle] pathForResource:self.urlString ofType:nil];
        path = [[NSBundle mainBundle] pathForResource:self.urlString ofType:nil];
    }
    //: NSURL *url = [NSURL fileURLWithPath:path];
    NSURL *url = [NSURL fileURLWithPath:path];
    //: NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //: [_webView loadRequest:request];
    [_webView loadRequest:request];

}

//: #pragma mark - WKNavigationDelegate
#pragma mark - WKNavigationDelegate
/* 页面开始加载 */
//: - (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}

/* 开始返回内容 */
//: - (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{

}

/* 页面加载完成 */
//: - (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{

}

/* 页面加载失败 */
//: - (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
- (void)size:(WKWebView *)webView beam:(WKNavigation *)navigation{

}




//: @end
@end

Byte *CountDateDataToByte(CountDateData *data) {
    if (data->displace) return data->cameraData;
    for (int i = 0; i < data->fileConcerning; i++) {
        data->cameraData[i] ^= data->lengthShouldFlavor;
    }
    data->cameraData[data->fileConcerning] = 0;
    data->displace = true;
	if (data->fileConcerning >= 1) {
		data->mutualDepressed = data->cameraData[0];
	}
    return data->cameraData;
}

NSString *StringFromCountDateData(CountDateData *data) {
    return [NSString stringWithUTF8String:(char *)CountDateDataToByte(data)];
}
