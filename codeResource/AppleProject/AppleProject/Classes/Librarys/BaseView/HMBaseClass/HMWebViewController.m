//
//  HMWebViewController.m
//  Panda
//
//  Created by Huamo on 2018/11/6.
//  Copyright © 2018年 chen. All rights reserved.
//

#import "HMWebViewController.h"
#import <WebKit/WebKit.h>

@interface HMWebViewController () <WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler> {
    
}
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic,assign) NSInteger loginType;

@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *agreeBtn;

@end


@implementation HMWebViewController

- (instancetype)init{
    if (self = [super init]) {
        _loginType = -1;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = _webTitle;
//    [self showCustomBackButton];
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg"]];
        UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        bg.image = [UIImage imageNamed:@"login_bg"];
        [self.view addSubview:bg];
    
    [self initUI];
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.backgroundColor = [UIColor clearColor];
    [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(15, 5+SCREEN_STATUS_HEIGHT, 40, 40);
    
    UIView *footview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_BOTTOM_HEIGHT-68, SCREEN_WIDTH, 68+SCREEN_BOTTOM_HEIGHT)];
    footview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footview];
    
    self.agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.agreeBtn.frame = CGRectMake(15, 12, SCREEN_WIDTH-30, 44);
    
    self.agreeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.agreeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.agreeBtn setTitle:@"Agreed" forState:UIControlStateNormal];

//    self.agreeBtn.layer.masksToBounds = YES;
    self.agreeBtn.backgroundColor = ThemeColor;
    self.agreeBtn.layer.cornerRadius = 10;
    self.agreeBtn.layer.shadowColor = DeepBtnColor.CGColor;
    self.agreeBtn.layer.shadowOffset = CGSizeMake(0,3);
    self.agreeBtn.layer.shadowOpacity = 1;
    self.agreeBtn.layer.shadowRadius = 0;

    [self.agreeBtn addTarget:self action:@selector(doAgree) forControlEvents:UIControlEventTouchUpInside];
    [footview addSubview:self.agreeBtn];
  
    
    [self reloadWebView];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)doAgree{
    
    if (self.complete) {
        self.complete();
    } else {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)dealloc {
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


#pragma mark - UI

- (void)initUI{
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg"]];
    
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
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 2)];
    self.progressView.backgroundColor = [UIColor blueColor];
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    [self.view addSubview:self.progressView];
     //*3.添加KVO，WKWebView有一个属性estimatedProgress，就是当前网页加载的进度，所以监听这个属性。
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    
    [self jsConfig];
    
}

- (void)reloadWebView{
    
    if (_urlString && _urlString.length > 0) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]];
        [_webView loadRequest:request];
    }else{
        
        NSURL * url = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
        NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"Privacy Agreement 20200602" ofType:@"html"];

        NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
        [_webView loadHTMLString:html baseURL:url];
        
        
    }
    
    

    
}

#pragma mark - WKNavigationDelegate

/* 页面开始加载 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
    
    
}

/* 开始返回内容 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

/* 页面加载完成 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.progressView.hidden = YES;
    
    
}

/* 页面加载失败 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    self.progressView.hidden = YES;
    
    
}

/* 在发送请求之前，决定是否跳转 */
/** JS端
 window.location = 'app://login?account=13011112222&password=123456';
 <a href="javascript:window.javatojs.backtoapp('1','1')">到详细页</a>"
*/
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    NSURLRequest *request = navigationAction.request;
//    NSString *scheme = request.URL.scheme;
//    NSString *host = request.URL.host;
//
//    // 一般用作交互的链接都会有一个固定的协议头，这里我们一“app”作为协议头为了，实际项目中可以修改
//    if ([scheme isEqualToString:@"app"]) { // scheme为“app”说明是做交互的链接
//        if ([host isEqualToString:@"login"]) { // host为“login”对应的就是登录操作
//
//        }
//
//        //不允许跳转
//        decisionHandler(WKNavigationActionPolicyCancel);
//        return;
//    }

    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
}




/* 在收到响应后，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    
}

#pragma mark - 监听加载进度

/*
 *4.在监听方法中获取网页加载的进度，并将进度赋给progressView.progress
 */

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        self.progressView.alpha = 1.0f;
        [self.progressView setProgress:newprogress animated:YES];
        if (newprogress >= 1.0f) {
            
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
    
}


#pragma mark - js

- (void)jsConfig{
    
    // js配置
    WKUserContentController *userContentController = _webView.configuration.userContentController;
    [userContentController addScriptMessageHandler:self name:@"jsCallOC"];
    
    _webView.configuration.userContentController = userContentController;
    
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    //NSLog(@"%@--%@", message.name, message.body);
    
    if ([message.name isEqualToString:@"jsCallOC"]) {
        [self dealJsData:message.body];
    }
    
    
}

- (void)dealJsData:(NSDictionary *)jsDict{
    if (!jsDict || jsDict.count<=0) {
        return;
    }
    
    NSInteger type = [[jsDict newStringValueForKey:@"type"] integerValue];
    //NSString *content = [jsDict newStringValueForKey:@"content"];
    
    
    if (type == 1) {
        //专题活动
        
        [self shareFirstOrder];
    }
    
}

- (void)shareFirstOrder{
    
//    if (![HMUserManager isLogin]) {
//        [HMUserManager loginWithDelegate:self rootController:self];
//        _loginType = 1;
//        return;
//    }
    
//    [self getOrderDataWithCache:NO];
}

- (void)loginSucceed{
    
    if (_loginType == 1) {
        [self shareFirstOrder];
        _loginType = -1;
    }
    
    
}

//- (void)getOrderDataWithCache:(BOOL)cache{
//    
//    if (!cache) {
//        [HMDataRequest deleteCacheWithUrl:@""];
//    }
//    
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setObject:@"4" forKey:@"orderStatus"];
//    [dict setObject:[HMUserManager getUserID] forKey:@"userId"];
//    [dict setObject:kConstant_1 forKey:@"pageSize"];
//    [dict setObject:kConstant_1 forKey:@"pageNo"];
//    
//    [HMDataRequest getRequestWithUrl:@"" withParams:dict withCacheTime:0 withIsShow:false CallBack:^(id responseObject, id error) {
//        
//        if (!error) {
//            NSDictionary *respondDict = responseObject;
//            NSDictionary *infoMap= [respondDict objectForKey:@"infoMap"];
//            NSString *flag = [infoMap objectForKey:@"flag"];
//            NSArray *resultList = [respondDict objectForKey:@"resultList"];
//            
//            
//            if ([flag isEqualToString:kConstant_1]) {
//                
//                if (resultList && [resultList isKindOfClass:[NSArray class]] && resultList.count > 0) {
//                    NSArray *orderGoods = [[resultList firstObject] valueObjectForKey:@"orderGoods"];
//                    
//                    if (orderGoods.count > 0) {
//                        //NSDictionary *goodsDict = [orderGoods firstObject];
//                        //[HMShareManager shareWithGoodsDict:goodsDict];
//                        return ;
//                    }
//                }
//            }
//            
//            
//            [self jumpToHomeWithNoOrder];
//            
//        } else{
//            HMLog(@"%@",error);
//        }
//    }];
//    
//}



@end
