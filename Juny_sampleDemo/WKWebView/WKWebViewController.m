//
//  WKWebViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/7/18.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <WebKit/WebKit.h>
#import "WKWebViewController.h"
#import <Masonry.h>
@interface WKWebViewController ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic, strong) WKWebView *webView; //
@property (nonatomic, strong)UIProgressView *progressView; //
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setViews];
    [self addObservers];
    if (_urlSring.length>0) {
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlSring]]];
    }
    
    
    [self performSelector:@selector(fuction1) withObject:nil afterDelay:2];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)setViews{
    //设置网页的配置文件
    WKWebViewConfiguration * Configuration = [[WKWebViewConfiguration alloc]init];
    //允许视频播放
    Configuration.allowsAirPlayForMediaPlayback = YES;
    // 允许在线播放
    Configuration.allowsInlineMediaPlayback = YES;
    // 允许可以与网页交互，选择视图
    Configuration.selectionGranularity = YES;
    // web内容处理池
    Configuration.processPool = [[WKProcessPool alloc] init];
    //自定义配置,一般用于 js调用oc方法(OC拦截URL中的数据做自定义操作)
    WKUserContentController * UserContentController = [[WKUserContentController alloc]init];
    // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
    [UserContentController addScriptMessageHandler:self name:@"WXPay"];
    // 是否支持记忆读取
    Configuration.suppressesIncrementalRendering = YES;
    // 允许用户更改网页的设置
    Configuration.userContentController = UserContentController;
    _webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:Configuration];
   
    [self.view addSubview:_webView];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    //开启手势触摸
    _webView.allowsBackForwardNavigationGestures = YES;
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 2)];
    self.progressView.progressTintColor = [UIColor redColor];
    self.progressView.trackTintColor = [UIColor purpleColor];
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    [self.view addSubview:self.progressView];
    

}

- (void)fuction1{
 
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://gist.github.com/cocoajin/9946826"]]];
   
}

- (void)addObservers{
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark --------------------observerActions------------------------- 

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
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
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
#pragma mark - WKUIDelegate
- (void)webViewDidClose:(WKWebView *)webView {
    NSLog(@"%s", __FUNCTION__);
}
/**
 获取JS里面的提示
 **/
// 在JS端调用alert函数时，会触发此代理方法。
// JS端调用alert时所传的数据可以通过message拿到
// 在原生得到结果后，需要回调JS，是通过completionHandler回调
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"%s", __FUNCTION__);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:@"JS调用alert" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
    NSLog(@"%@", message);
}

/**
 JS信息的交流
 **/
// JS端调用confirm函数时，会触发此方法
// 通过message可以拿到JS端所传的数据
// 在iOS端显示原生alert得到YES/NO后
// 通过completionHandler回调给JS端
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    NSLog(@"%s", __FUNCTION__);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"confirm" message:@"JS调用confirm" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
    
    NSLog(@"%@", message);
}
/**
交互，可输入文本
 **/
// JS端调用prompt函数时，会触发此方法
// 要求输入一段文本
// 在原生输入得到文本内容后，通过completionHandler回调给JS
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler {
    NSLog(@"%s", __FUNCTION__);
    
    NSLog(@"%@", prompt);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"textinput" message:@"JS调用输入框" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.textColor = [UIColor redColor];
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler([[alert.textFields lastObject] text]);
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}



#pragma mark --------------------navigationDelegate-------------------------


/*
 网页开始加载时调用
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation;
{
    NSLog(@"start----");
     NSLog(@"%s",__func__);
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
    
  
}
//内容返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"%s",__func__);
}

//服务器请求跳转的时候调用
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"%s",__func__);
}

//服务器开始请求的时候调用
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    //    NSString* orderInfo = [[AlipaySDK defaultService]fetchOrderInfoFromH5PayUrl:[navigationAction.request.URL absoluteString]];
//    //    if (orderInfo.length > 0) {
//    //        [self payWithUrlOrder:orderInfo];
//    //    }
//    //    //拨打电话
//    //    //兼容安卓的服务器写法:<a class = "mobile" href = "tel://电话号码"></a>
//    //    NSString *mobileUrl = [[navigationAction.request URL] absoluteString];
//    //    mobileUrl = [mobileUrl stringByRemovingPercentEncoding];
//    //    NSArray *urlComps = [mobileUrl componentsSeparatedByString:@"://"];
//    //    if ([urlComps count]){
//    //
//    //        if ([[urlComps objectAtIndex:0] isEqualToString:@"tel"]) {
//    //
//    //            UIAlertController *mobileAlert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"拨号给 %@ ？",urlComps.lastObject] preferredStyle:UIAlertControllerStyleAlert];
//    //            UIAlertAction *suerAction = [UIAlertAction actionWithTitle:@"拨号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//    //
//    //                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mobileUrl]];
//    //            }];
//    //            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//    //                return ;
//    //            }];
//    //
//    //            [mobileAlert addAction:suerAction];
//    //            [mobileAlert addAction:cancelAction];
//    //
//    //            [self presentViewController:mobileAlert animated:YES completion:nil];
//    //        }
//    //    }
//    
//    
//    switch (navigationAction.navigationType) {
//        case WKNavigationTypeLinkActivated: {
//            [self pushCurrentSnapshotViewWithRequest:navigationAction.request];
//            break;
//        }
//        case WKNavigationTypeFormSubmitted: {
//            [self pushCurrentSnapshotViewWithRequest:navigationAction.request];
//            break;
//        }
//        case WKNavigationTypeBackForward: {
//            break;
//        }
//        case WKNavigationTypeReload: {
//            break;
//        }
//        case WKNavigationTypeFormResubmitted: {
//            break;
//        }
//        case WKNavigationTypeOther: {
//            [self pushCurrentSnapshotViewWithRequest:navigationAction.request];
//            break;
//        }
//        default: {
//            break;
//        }
//    }
//    [self updateNavigationItems];
//    decisionHandler(WKNavigationActionPolicyAllow);
//}
/*
 加载完成
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%s",__func__);
    //加载完成后隐藏progressView
    //self.progressView.hidden = YES;
    
}

// 内容加载失败时候调用
-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"%s",__func__);
    NSLog(@"内容加载失败-----");
}
/*
 跳转失败时调用
 */
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
     NSLog(@"error----%@",error);
    NSLog(@"%s",__func__);
    //加载失败同样需要隐藏progressView
    //self.progressView.hidden = YES;
}

//进度条
-(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    NSLog(@"%s",__func__);
}





@end
