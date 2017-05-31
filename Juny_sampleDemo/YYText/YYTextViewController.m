//
//  YYTextViewController.m
//  Juny_sampleDemo
//
//  Created by JH on 2017/5/31.
//  Copyright © 2017年 Juny. All rights reserved.
//
#import <YYText.h>

#import "YYTextViewController.h"

@interface YYTextViewController ()

@property (nonatomic, copy)NSAttributedString *text; //
@property (nonatomic, strong)YYLabel *label; //
@property (nonatomic, strong)UIButton *expandButton; //
@property (nonatomic, strong)NSAttributedString *expandText; //




@end

@implementation YYTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --------------------private-------------------------

- (void)initData{
    _text = [[NSAttributedString alloc]initWithString:@"你所说的     计时定时；点击；案件大家；的；爱打架；adjacent；点击；大家都来；爱神的箭卡；来得及啊；的；大奖拿大炮假的少那肯定卡刘德华；"];
    __weak typeof(self) _self = self;
    YYTextHighlight *hi = [YYTextHighlight new];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        YYLabel *label = _self.label;
        label.attributedText = _self.text;
        label.numberOfLines = 2;
        [label sizeToFit];
        
    };
    NSMutableAttributedString *smallSting = [[NSMutableAttributedString alloc]initWithAttributedString:_text];
    
    NSMutableAttributedString *attachment = nil;
    UIImage *image = [UIImage imageNamed:@"up"];
    attachment = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:[UIFont systemFontOfSize:16] alignment:YYTextVerticalAlignmentCenter];
    [smallSting appendAttributedString:attachment];
    [smallSting yy_setTextHighlight:hi range:NSMakeRange(_text.length, attachment.length)];
    
    _expandText = smallSting;
}
- (void)initView{
    
    
    _label = [YYLabel new];
    _label.font = [UIFont systemFontOfSize:16];
    _label.userInteractionEnabled = YES;
    _label.numberOfLines = 0;
    _label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _label.frame = CGRectMake(50, 100, 200, 38);
    _label.attributedText = _text;
    [self addSeeMoreButton];
    [self.view addSubview:_label];
    

    

  

    
}

- (void)addSeeMoreButton {
    __weak typeof(self) _self = self;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    
    YYTextHighlight *hi = [YYTextHighlight new];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        YYLabel *label = _self.label;
        label.numberOfLines = 0;
        label.attributedText = _self.expandText;
        [label sizeToFit];
    };
    
    NSMutableAttributedString *attachment = nil;
    UIImage *image = [UIImage imageNamed:@"down"] ;
    attachment = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:[UIFont systemFontOfSize:16] alignment:YYTextVerticalAlignmentCenter];
    [text appendAttributedString:attachment];
    [text yy_setTextHighlight:hi range:NSMakeRange(0, attachment.length)];
    
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    
    
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentBottom];
    _label.truncationToken = truncationToken;
}



#pragma mark --------------------btnClick-------------------------



@end
