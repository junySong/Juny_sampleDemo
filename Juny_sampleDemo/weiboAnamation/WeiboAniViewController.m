//
//  WeiboAniViewController.m
//  Juny_sampleDemo
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Weight [UIScreen mainScreen].bounds.size.width
#import "WeiboAniViewController.h"

@interface WeiboAniViewController ()
@property (nonatomic, strong)UIView *tabberView;
@property (nonatomic, strong)UIButton *middleButton;
@property (nonatomic, strong)NSMutableArray *btnArray;
@end

@implementation WeiboAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    _btnArray = [NSMutableArray array];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -------------------------- inintView

- (void)initView{
    _tabberView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49)];
    [self.view addSubview:_tabberView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Weight, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [_tabberView addSubview:lineView];
    
    CGFloat buttonW = 49;
    _middleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_middleButton setImage:[UIImage imageNamed:@"chooser-button-input@2x"] forState:UIControlStateNormal];
    _middleButton.frame = CGRectMake((Screen_Weight-buttonW)/2.0, 0, buttonW, 49);
    [_tabberView addSubview:_middleButton];
    
    [_middleButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn1 = [self createButtonWithImageName:@"chooser-moment-icon-music"];
    UIButton *btn2 = [self createButtonWithImageName:@"chooser-moment-icon-place"];
    UIButton *btn3 = [self createButtonWithImageName:@"chooser-moment-icon-camera"];
    UIButton *btn4 = [self createButtonWithImageName:@"chooser-moment-icon-thought"];
    UIButton *btn5 = [self createButtonWithImageName:@"chooser-moment-icon-sleep"];
    
    [_btnArray addObjectsFromArray:@[btn1,btn2,btn3,btn4,btn5]];
    CGFloat gap = (Screen_Weight - buttonW*5)/6.0;
    for (int i=0; i< _btnArray.count; i++) {
        UIButton *btn = [_btnArray objectAtIndex:i];
        [self.view addSubview:btn];
        btn.frame = CGRectMake(gap+(buttonW+gap)*i, Screen_Height+buttonW, buttonW, buttonW);
    }
    
    [self.view bringSubviewToFront:_middleButton];
    
}
/*
 **+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
 ** duration :动画的总持续时间，以秒为单位。 如果指定负值或0 ，则不进行动画更改。
 **delay:在开始动画之前等待的时间量（以秒为单位）。 指定值0即可立即开始动画。
 ** damping Ratio:阻尼动画接近静止状态时的阻尼比。
 为了平稳地减速动画而不产生振荡，请使用值1 。 采用接近零的阻尼比增加振荡。
 **velocity: 初始弹簧速度。 为了顺利启动动画，请将该值与视图的速度相匹配。值为1对应于在一秒内遍历的总动画距离。 例如，如果总动画距离为200点，并且您希望动画开始匹配视图速度为100 pt / s，请使用值为0 .5 。
 ** animations:包含更改以提交到视图的块对象。 这是您以编程方式更改视图层次结构中视图的任何可动画属性的位置。 该块不带参数，没有返回值。 此参数不能为NULL 。
 **completion:当动画序列结束时要执行的块对象。 该块没有返回值，并且采用一个布尔参数，指示在完成处理程序被调用之前动画是否实际完成。 如果动画的持续时间为0，则在下一个运行循环周期的开始执行该块。 此参数可能为NULL
 
 */

/*
 
 UIView Animation Option Layout Subviews
 在提交时放置子视图，以便与父项一起动画。
 UIView Animation Option Allow User Interaction
 允许用户在动画时与视图进行交互。
 UIView Animation Option Begin From Current State
 从与已经在飞行中的动画相关联的当前设置启动动画。
 UIView Animation Option Repeat
 无限期重复动画。
 UIView Animation Option Autoreverse
 向后和向后运行动画（必须与重复选项组合）。
 UIView Animation Option Override Inherited Duration
 强制动画使用动画提交时指定的原始持续时间值。
 UIView Animation Option Override Inherited Curve
 强制动画使用动画提交时指定的原始曲线值。
 UIView Animation Option Allow Animated Content
 通过动态更改属性值并重新绘制视图来动画化视图。
 UIView Animation Option Show Hide Transition Views
 在视图转换期间隐藏或显示视图。
 UIView Animation Option Override Inherited Options
 不继承动画类型或任何选项的选项。
 UIView Animation Option Curve Ease In Out
 指定一个简单易用的曲线，这导致动画慢慢开始，在其持续时间的中间加速，然后在完成之前再次减慢。
 UIView Animation Option Curve Ease In
 一个简单的曲线使动画开始缓慢，然后加快进度。
 UIView Animation Option Curve Ease Out
 一个简单的曲线使动画开始快速，然后慢慢完成。
 UIView Animation Option Curve Linear
 线性动画曲线导致动画在其持续时间内均匀地发生。
 UIView Animation Option Transition None
 没有指定转换。
 UIView Animation Option Transition Flip From Left
 从左到右翻转其垂直轴视图的转换（视图的左侧朝向前侧和右侧向后移动）。
 UIView Animation Option Transition Flip From Right
 从右到左翻转其垂直轴视图的转换（视图的右侧朝向前侧和左侧向后移动）。
 UIView Animation Option Transition Curl Up
 从底部卷曲视图的过渡。
 UIView Animation Option Transition Curl Down
 从顶部卷曲视图的过渡。
 UIView Animation Option Transition Cross Dissolve
 从一个视图解散到下一个视图的转换。
 UIView Animation Option Transition Flip From Top
 从顶部到底部翻转其水平轴线的视图（视图的顶部朝向前部和底部朝向后方移动）的转换。
 UIView Animation Option Transition Flip From Bottom
 从底部到顶部翻转其水平轴线的视图（视图的底侧朝向前方移动，顶侧朝向后方）。
 UIView Animation Option Preferred Frames Per Second Default
 默认每秒帧数。
 UIView Animation Option Preferred Frames Per Second30
 帧速率为每秒30帧。
 UIView Animation Option Preferred Frames Per Second60
 帧速率为每秒60帧。
 */
- (void)btnClick:(UIButton*)sender{
    sender.selected = !sender.selected;
    CGFloat buttonW = 49;
    CGFloat gap = (Screen_Weight - buttonW*5)/6.0;
    
    if (sender.selected) {
        
        
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            for (int i=0; i< _btnArray.count; i++) {
                UIButton *btn = [_btnArray objectAtIndex:i];
                btn.frame = CGRectMake(gap+(buttonW+gap)*i, Screen_Height - 100, buttonW, buttonW);
            }
            
        } completion:^(BOOL finished) {
            
        }];
    }else{
        
        [UIView animateWithDuration:1 animations:^{
            for (int i=0; i< _btnArray.count; i++) {
                UIButton *btn = [_btnArray objectAtIndex:i];
                btn.frame = CGRectMake(gap+(buttonW+gap)*i, Screen_Height+buttonW, buttonW, buttonW);
                
            }
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
        
        
        
    }
}


- (UIButton*)createButtonWithImageName:(NSString*)imageName{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    return btn;
}

@end
