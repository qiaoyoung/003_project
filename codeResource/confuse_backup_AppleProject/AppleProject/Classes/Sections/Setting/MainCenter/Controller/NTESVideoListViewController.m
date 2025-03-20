//
//  NTESVideoListViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/6/26.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESVideoListViewController.h"
#import "NTESVideolistCollectionViewCell.h"
#import "NSString+NTES.h"
#import <WebKit/WebKit.h>

#define tikUrl @"https://www.tiktok.com/foryou"
#define kwaiUrl @"https://www.kwai.com/foryou"
#define trillerUrl @"https://triller.co/m"


@interface NTESVideoListViewController ()<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;

@property (strong, nonatomic)  UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *videosList;

@property (strong, nonatomic)  UIButton *tikBtn;
@property (strong, nonatomic)  UIButton *kwaiBtn;
@property (strong, nonatomic)  UIButton *TrillerBtn;

@property (nonatomic,strong) NSString *urlString;

@end

@implementation NTESVideoListViewController

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//
//    }
//    return self;
//}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];

    UIView *typeview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_STATUS_HEIGHT, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
//    typeview.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
//    typeview.layer.cornerRadius = 30;
//    typeview.userInteractionEnabled = YES;
    [self.view addSubview:typeview];
    
    CGFloat spacing1 = 15;//行、列 间距
    int totalloc1 = 3;//列数
    CGFloat appvieww1 = (SCREEN_WIDTH - spacing1*4)/totalloc1;
    
    _tikBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _tikBtn.frame = CGRectMake(spacing1, 7, appvieww1, 30);
    _tikBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
    _tikBtn.layer.cornerRadius = 15;
    _tikBtn.titleLabel.font   = [UIFont systemFontOfSize:14];
    [_tikBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_tikBtn setTitle:@"TikTok" forState:UIControlStateNormal];
    [_tikBtn addTarget:self action:@selector(handlerTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [typeview addSubview:_tikBtn];
    
    _kwaiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _kwaiBtn.frame = CGRectMake(spacing1*2+appvieww1, 7, appvieww1, 30);
    _kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    _kwaiBtn.layer.cornerRadius = 15;
    _kwaiBtn.titleLabel.font   = [UIFont systemFontOfSize:14];
    [_kwaiBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
//    [_kwaiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_kwaiBtn setTitle:@"Kwai" forState:UIControlStateNormal];
    [_kwaiBtn addTarget:self action:@selector(handlerTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [typeview addSubview:_kwaiBtn];
    
    _TrillerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _TrillerBtn.frame = CGRectMake(spacing1*3+appvieww1*2, 7, appvieww1, 30);
    _TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    _TrillerBtn.layer.cornerRadius = 15;
    _TrillerBtn.titleLabel.font   = [UIFont systemFontOfSize:14];
    [_TrillerBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    [_TrillerBtn setTitle:@"Triller" forState:UIControlStateNormal];
    [_TrillerBtn addTarget:self action:@selector(handlerTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [typeview addSubview:_TrillerBtn];
    
//    CGFloat spacing = 15;//行、列 间距
//    int totalloc = 2;//列数
//    CGFloat appvieww = (SCREEN_WIDTH - spacing*3)/totalloc;
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(appvieww, appvieww*1.3 + 50);
//    CGFloat lineSpacing = 15;
//    flowLayout.minimumLineSpacing = 15;
//    flowLayout.minimumInteritemSpacing = lineSpacing;
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
//
//    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT) collectionViewLayout:flowLayout];
//    self.collectionView.backgroundColor = [UIColor clearColor];
//    self.collectionView.dataSource = self;
//    self.collectionView.delegate = self;
//
////    [self.collectionView registerClass:[NTESVideolistCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([NTESVideolistCollectionViewCell class])];
//    [self.collectionView registerClass:[NTESVideolistCollectionViewCell class] forCellWithReuseIdentifier:@"TZVideoCell"];
//    [self.view addSubview:self.collectionView];
//
//    [self.collectionView reloadData];
    
    self.urlString = tikUrl;
    [self initUI];
    [self reloadWebView];
    
}

- (void)handlerTopBtn:(UIButton *)sender
{
    if(sender == self.tikBtn){
        self.urlString = tikUrl;
        self.tikBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
        [self.tikBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        [self.kwaiBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
        
        self.TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        [self.TrillerBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
        
    }
    else if (sender == self.kwaiBtn){
        self.urlString = kwaiUrl;
        self.kwaiBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
        [self.kwaiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.tikBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        [self.tikBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
        
        self.TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        [self.TrillerBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    }
    else if (sender == self.TrillerBtn){
        self.urlString = trillerUrl;
        self.TrillerBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
        [self.TrillerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        [self.kwaiBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
        
        self.tikBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        [self.tikBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    }
    
    [self reloadWebView];
}
- (void)dealloc {
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)initUI{
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
//    config.selectionGranularity = WKSelectionGranularityDynamic;
    config.allowsPictureInPictureMediaPlayback = YES;
    config.allowsInlineMediaPlayback = YES;
    WKPreferences *preferences = [WKPreferences new];
    //是否支持JavaScript
    preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
//    preferences.javaScriptCanOpenWindowsAutomatically = NO;
    config.preferences = preferences;
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT+2, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_TABBAR_HEIGHT-SCREEN_BOTTOM_HEIGHT-2) configuration:config];
    [self.view addSubview:_webView];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, 2)];
    self.progressView.backgroundColor = [UIColor clearColor];
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    [self.view addSubview:self.progressView];

    
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(0);
//        make.top.mas_equalTo(self.view).mas_offset(SCREEN_TOP_HEIGHT+2);
//        make.right.mas_offset(0);
//        make.bottom.mas_offset(SCREEN_TABBAR_HEIGHT);
//    }];

//    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(0);
//        make.right.mas_offset(0);
//        make.top.mas_offset(SCREEN_TOP_HEIGHT);
//        make.height.mas_equalTo(2);
//    }];
    
     //*3.添加KVO，WKWebView有一个属性estimatedProgress，就是当前网页加载的进度，所以监听这个属性。
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    //[_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    
}

- (void)reloadWebView{
    
    /* 加载服务器url的方法*/
    NSString *urlString = _urlString;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [_webView loadRequest:request];
    
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
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
    
}

/* 在收到响应后，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}


#pragma mark - 监听加载进度

/*
 *4.在监听方法中获取网页加载的进度，并将进度赋给progressView.progress
 */

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if (object == self.webView && [keyPath isEqualToString:@"title"]) {
//        self.navigationItem.title = self.webView.title;
//        [NIMUserDefaults standardUserDefaults].webViewTitle = self.webView.title;
    }else if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
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



//#pragma mark -- UICollectionViewDataSource
////返回分区个数
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
////返回每个分区的item个数
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 10;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
////    EDLCerBrandList *model = self.brandList[indexPath.row];
//
//    NTESVideolistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZVideoCell" forIndexPath:indexPath];
//
//
//    return cell;
//}
//
//#pragma mark -- UICollectionViewDelegate
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//
//}


@end
