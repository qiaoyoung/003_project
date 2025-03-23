
#import <Foundation/Foundation.h>
typedef struct {
    Byte countLow;
    Byte *rum;
    unsigned int scheduleBloc;
    bool prise;
	int marginOfError;
	int commissionTropic;
	int labShould;
} ImageTitleData;

NSString *StringFromImageTitleData(ImageTitleData *data);


//: https://www.tiktok.com/foryou
ImageTitleData str_suraName = (ImageTitleData){214, (Byte []){190, 162, 162, 166, 165, 236, 249, 249, 161, 161, 161, 248, 162, 191, 189, 162, 185, 189, 248, 181, 185, 187, 249, 176, 185, 164, 175, 185, 163, 223}, 29, false, 11, 19, 179};


//: Kwai
ImageTitleData str_rideTitle = (ImageTitleData){199, (Byte []){140, 176, 166, 174, 14}, 4, false, 65, 71, 187};


//: Triller
ImageTitleData str_townName = (ImageTitleData){69, (Byte []){17, 55, 44, 41, 41, 32, 55, 230}, 7, false, 216, 148, 96};


//: #875FFA
ImageTitleData str_sorryText = (ImageTitleData){61, (Byte []){30, 5, 10, 8, 123, 123, 124, 35}, 7, false, 69, 250, 173};


//: estimatedProgress
ImageTitleData str_postIconData = (ImageTitleData){209, (Byte []){180, 162, 165, 184, 188, 176, 165, 180, 181, 129, 163, 190, 182, 163, 180, 162, 162, 104}, 17, false, 111, 119, 108};


//: https://www.kwai.com/foryou
ImageTitleData str_seventhModelName = (ImageTitleData){215, (Byte []){191, 163, 163, 167, 164, 237, 248, 248, 160, 160, 160, 249, 188, 160, 182, 190, 249, 180, 184, 186, 248, 177, 184, 165, 174, 184, 162, 167}, 27, false, 95, 137, 166};


//: TikTok
ImageTitleData str_showRecordValue = (ImageTitleData){25, (Byte []){77, 112, 114, 77, 118, 114, 237}, 6, false, 134, 119, 67};


//: 666666
ImageTitleData str_concerningValue = (ImageTitleData){225, (Byte []){215, 215, 215, 215, 215, 215, 146}, 6, false, 37, 27, 132};


//: https://triller.co/m
ImageTitleData str_pointSchemeValue = (ImageTitleData){193, (Byte []){169, 181, 181, 177, 178, 251, 238, 238, 181, 179, 168, 173, 173, 164, 179, 239, 162, 174, 238, 172, 178}, 20, false, 234, 239, 250};


//: title
ImageTitleData str_luckySendData = (ImageTitleData){158, (Byte []){234, 247, 234, 242, 251, 116}, 5, false, 75, 209, 161};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MinViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/6/26.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESVideoListViewController.h"
#import "MinViewController.h"
//: #import "NTESVideolistCollectionViewCell.h"
#import "DataReusableView.h"
//: #import "NSString+NTES.h"
#import "NSString+Status.h"
//: #import <WebKit/WebKit.h>
#import <WebKit/WebKit.h>

//: @interface NTESVideoListViewController ()<WKNavigationDelegate,WKUIDelegate>
@interface MinViewController ()<WKNavigationDelegate,WKUIDelegate>

//: @property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) WKWebView *webView;
//: @property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIProgressView *progressView;

//: @property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionView *collectionView;
//: @property (nonatomic,strong) NSArray *videosList;
@property (nonatomic,strong) NSArray *videosList;

//: @property (strong, nonatomic) UIButton *tikBtn;
@property (strong, nonatomic) UIButton *tikBtn;
//: @property (strong, nonatomic) UIButton *kwaiBtn;
@property (strong, nonatomic) UIButton *kwaiBtn;
//: @property (strong, nonatomic) UIButton *TrillerBtn;
@property (strong, nonatomic) UIButton *TrillerBtn;

//: @property (nonatomic,strong) NSString *urlString;
@property (nonatomic,strong) NSString *urlString;

//: @end
@end

//: @implementation NTESVideoListViewController
@implementation MinViewController

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//
//    }
//    return self;
//}

//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBarHidden = YES;
}

//: - (void)viewWillDisappear:(BOOL)animated{
- (void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBarHidden = NO;
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //: self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];

    //: UIView *typeview = [[UIView alloc]initWithFrame:CGRectMake(0, [UIDevice vg_statusBarHeight], [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *typeview = [[UIView alloc]initWithFrame:CGRectMake(0, [UIDevice task], [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
//    typeview.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
//    typeview.layer.cornerRadius = 30;
//    typeview.userInteractionEnabled = YES;
    //: [self.view addSubview:typeview];
    [self.view addSubview:typeview];

    //: CGFloat spacing1 = 15;
    CGFloat spacing1 = 15;//行、列 间距
    //: int totalloc1 = 3;
    int totalloc1 = 3;//列数
    //: CGFloat appvieww1 = ([[UIScreen mainScreen] bounds].size.width - spacing1*4)/totalloc1;
    CGFloat appvieww1 = ([[UIScreen mainScreen] bounds].size.width - spacing1*4)/totalloc1;

    //: _tikBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _tikBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _tikBtn.frame = CGRectMake(spacing1, 7, appvieww1, 30);
    _tikBtn.frame = CGRectMake(spacing1, 7, appvieww1, 30);
    //: _tikBtn.backgroundColor = [UIColor colorWithHexString:@"#875FFA"];
    _tikBtn.backgroundColor = [UIColor direction:StringFromImageTitleData(&str_sorryText)];
    //: _tikBtn.layer.cornerRadius = 15;
    _tikBtn.layer.cornerRadius = 15;
    //: _tikBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _tikBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //: [_tikBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_tikBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //: [_tikBtn setTitle:@"TikTok" forState:UIControlStateNormal];
    [_tikBtn setTitle:StringFromImageTitleData(&str_showRecordValue) forState:UIControlStateNormal];
    //: [_tikBtn addTarget:self action:@selector(handlerTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_tikBtn addTarget:self action:@selector(accountContainer:) forControlEvents:UIControlEventTouchUpInside];
    //: [typeview addSubview:_tikBtn];
    [typeview addSubview:_tikBtn];

    //: _kwaiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _kwaiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _kwaiBtn.frame = CGRectMake(spacing1*2+appvieww1, 7, appvieww1, 30);
    _kwaiBtn.frame = CGRectMake(spacing1*2+appvieww1, 7, appvieww1, 30);
    //: _kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    _kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    //: _kwaiBtn.layer.cornerRadius = 15;
    _kwaiBtn.layer.cornerRadius = 15;
    //: _kwaiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _kwaiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //: [_kwaiBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    [_kwaiBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];
//    [_kwaiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //: [_kwaiBtn setTitle:@"Kwai" forState:UIControlStateNormal];
    [_kwaiBtn setTitle:StringFromImageTitleData(&str_rideTitle) forState:UIControlStateNormal];
    //: [_kwaiBtn addTarget:self action:@selector(handlerTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_kwaiBtn addTarget:self action:@selector(accountContainer:) forControlEvents:UIControlEventTouchUpInside];
    //: [typeview addSubview:_kwaiBtn];
    [typeview addSubview:_kwaiBtn];

    //: _TrillerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _TrillerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _TrillerBtn.frame = CGRectMake(spacing1*3+appvieww1*2, 7, appvieww1, 30);
    _TrillerBtn.frame = CGRectMake(spacing1*3+appvieww1*2, 7, appvieww1, 30);
    //: _TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    _TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
    //: _TrillerBtn.layer.cornerRadius = 15;
    _TrillerBtn.layer.cornerRadius = 15;
    //: _TrillerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _TrillerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //: [_TrillerBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    [_TrillerBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];
    //: [_TrillerBtn setTitle:@"Triller" forState:UIControlStateNormal];
    [_TrillerBtn setTitle:StringFromImageTitleData(&str_townName) forState:UIControlStateNormal];
    //: [_TrillerBtn addTarget:self action:@selector(handlerTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_TrillerBtn addTarget:self action:@selector(accountContainer:) forControlEvents:UIControlEventTouchUpInside];
    //: [typeview addSubview:_TrillerBtn];
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
////    [self.collectionView registerClass:[DataReusableView class] forCellWithReuseIdentifier:NSStringFromClass([DataReusableView class])];
//    [self.collectionView registerClass:[DataReusableView class] forCellWithReuseIdentifier:@"TZVideoCell"];
//    [self.view addSubview:self.collectionView];
//
//    [self.collectionView reloadData];

    //: self.urlString = @"https://www.tiktok.com/foryou";
    self.urlString = StringFromImageTitleData(&str_suraName);
    //: [self initUI];
    [self initSize];
    //: [self reloadWebView];
    [self originMessage];

}

//: - (void)handlerTopBtn:(UIButton *)sender
- (void)accountContainer:(UIButton *)sender
{
    //: if(sender == self.tikBtn){
    if(sender == self.tikBtn){
        //: self.urlString = @"https://www.tiktok.com/foryou";
        self.urlString = StringFromImageTitleData(&str_suraName);
        //: self.tikBtn.backgroundColor = [UIColor colorWithHexString:@"#875FFA"];
        self.tikBtn.backgroundColor = [UIColor direction:StringFromImageTitleData(&str_sorryText)];
        //: [self.tikBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.tikBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        //: self.kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        self.kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        //: [self.kwaiBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [self.kwaiBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];

        //: self.TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        self.TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        //: [self.TrillerBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [self.TrillerBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];

    }
    //: else if (sender == self.kwaiBtn){
    else if (sender == self.kwaiBtn){
        //: self.urlString = @"https://www.kwai.com/foryou";
        self.urlString = StringFromImageTitleData(&str_seventhModelName);
        //: self.kwaiBtn.backgroundColor = [UIColor colorWithHexString:@"#875FFA"];
        self.kwaiBtn.backgroundColor = [UIColor direction:StringFromImageTitleData(&str_sorryText)];
        //: [self.kwaiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.kwaiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        //: self.tikBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        self.tikBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        //: [self.tikBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [self.tikBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];

        //: self.TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        self.TrillerBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        //: [self.TrillerBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [self.TrillerBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];
    }
    //: else if (sender == self.TrillerBtn){
    else if (sender == self.TrillerBtn){
        //: self.urlString = @"https://triller.co/m";
        self.urlString = StringFromImageTitleData(&str_pointSchemeValue);
        //: self.TrillerBtn.backgroundColor = [UIColor colorWithHexString:@"#875FFA"];
        self.TrillerBtn.backgroundColor = [UIColor direction:StringFromImageTitleData(&str_sorryText)];
        //: [self.TrillerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.TrillerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        //: self.kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        self.kwaiBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        //: [self.kwaiBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [self.kwaiBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];

        //: self.tikBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        self.tikBtn.backgroundColor = [UIColor colorWithRed:97/255.0 green:44/255.0 blue:249/255.0 alpha:0.1000];
        //: [self.tikBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [self.tikBtn setTitleColor:[UIColor direction:StringFromImageTitleData(&str_concerningValue)] forState:UIControlStateNormal];
    }

    //: [self reloadWebView];
    [self originMessage];
}
//: - (void)dealloc {
- (void)dealloc {
    //: [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [_webView removeObserver:self forKeyPath:StringFromImageTitleData(&str_postIconData)];
}

//: - (void)initUI{
- (void)initSize{

    //: WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
//    config.selectionGranularity = WKSelectionGranularityDynamic;
    //: config.allowsPictureInPictureMediaPlayback = YES;
    config.allowsPictureInPictureMediaPlayback = YES;
    //: config.allowsInlineMediaPlayback = YES;
    config.allowsInlineMediaPlayback = YES;
    //: WKPreferences *preferences = [WKPreferences new];
    WKPreferences *preferences = [WKPreferences new];
    //是否支持JavaScript
    //: preferences.javaScriptEnabled = YES;
    preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
//    preferences.javaScriptCanOpenWindowsAutomatically = NO;
    //: config.preferences = preferences;
    config.preferences = preferences;

    //: _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight])+2, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-(49.0f)-(({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom)-2) configuration:config];
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice task])+2, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-(49.0f)-(({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom)-2) configuration:config];
    //: [self.view addSubview:_webView];
    [self.view addSubview:_webView];
    //: _webView.navigationDelegate = self;
    _webView.navigationDelegate = self;
    //: _webView.UIDelegate = self;
    _webView.UIDelegate = self;


    //: self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, 2)];
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, 2)];
    //: self.progressView.backgroundColor = [UIColor clearColor];
    self.progressView.backgroundColor = [UIColor clearColor];
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    //: self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //: [self.view addSubview:self.progressView];
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
    //: [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [_webView addObserver:self forKeyPath:StringFromImageTitleData(&str_postIconData) options:NSKeyValueObservingOptionNew context:nil];
    //[_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];

}

//: - (void)reloadWebView{
- (void)originMessage{

    /* 加载服务器url的方法*/
    //: NSString *urlString = _urlString;
    NSString *urlString = _urlString;
    //: NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    //: [_webView loadRequest:request];
    [_webView loadRequest:request];

}

//: #pragma mark - WKNavigationDelegate
#pragma mark - WKNavigationDelegate

/* 页面开始加载 */
//: - (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

    //: self.progressView.hidden = NO;
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    //: self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    //: [self.view bringSubviewToFront:self.progressView];
    [self.view bringSubviewToFront:self.progressView];


}

/* 开始返回内容 */
//: - (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{

}

/* 页面加载完成 */
//: - (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //: self.progressView.hidden = YES;
    self.progressView.hidden = YES;


}

/* 页面加载失败 */
//: - (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
- (void)papers:(WKWebView *)webView info:(WKNavigation *)navigation{
    //: self.progressView.hidden = YES;
    self.progressView.hidden = YES;


}

/* 在发送请求之前，决定是否跳转 */
//: - (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    //允许跳转
    //: decisionHandler(WKNavigationActionPolicyAllow);
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);

}

/* 在收到响应后，决定是否跳转 */
//: - (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{

    //: NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    //: decisionHandler(WKNavigationResponsePolicyAllow);
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}


//: #pragma mark - 监听加载进度
#pragma mark - 监听加载进度

/*
 *4.在监听方法中获取网页加载的进度，并将进度赋给progressView.progress
 */

//: - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {

    //: if (object == self.webView && [keyPath isEqualToString:@"title"]) {
    if (object == self.webView && [keyPath isEqualToString:StringFromImageTitleData(&str_luckySendData)]) {
//        self.navigationItem.title = self.webView.title;
//        [WastepaperBasketDefaults standardUserDefaults].webViewTitle = self.webView.title;
    //: }else if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
    }else if (object == self.webView && [keyPath isEqualToString:StringFromImageTitleData(&str_postIconData)]) {
        //: CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        //: self.progressView.alpha = 1.0f;
        self.progressView.alpha = 1.0f;
        //: [self.progressView setProgress:newprogress animated:YES];
        [self.progressView setProgress:newprogress animated:YES];
        //: if (newprogress >= 1.0f) {
        if (newprogress >= 1.0f) {

            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            //: __weak typeof (self)weakSelf = self;
            __weak typeof (self)weakSelf = self;
            //: [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                //: weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            //: } completion:^(BOOL finished) {
            } completion:^(BOOL finished) {
                //: weakSelf.progressView.hidden = YES;
                weakSelf.progressView.hidden = YES;

            //: }];
            }];
        }

    //: } else {
    } else {
        //: [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
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
//    DataReusableView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZVideoCell" forIndexPath:indexPath];
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


//: @end
@end

Byte *ImageTitleDataToByte(ImageTitleData *data) {
    if (data->prise) return data->rum;
    for (int i = 0; i < data->scheduleBloc; i++) {
        data->rum[i] ^= data->countLow;
    }
    data->rum[data->scheduleBloc] = 0;
    data->prise = true;
	if (data->scheduleBloc >= 3) {
		data->marginOfError = data->rum[0];
		data->commissionTropic = data->rum[1];
		data->labShould = data->rum[2];
	}
    return data->rum;
}

NSString *StringFromImageTitleData(ImageTitleData *data) {
    return [NSString stringWithUTF8String:(char *)ImageTitleDataToByte(data)];
}
