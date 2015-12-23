//
//  ViewController.m
//  CLKeyboardOffsetView
//
//  Created by 李辉 on 15/12/22.
//  Copyright © 2015年 李辉. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CLKeyboardOffsetView.h"


@interface ViewController () <CLKeyboardOffsetViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *testTextField;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 点击视图收起键盘
    UITapGestureRecognizer *tapViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewGesture:)];
    [self.view addGestureRecognizer:tapViewGesture];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 打开键盘补偿视图
    [self.view openKeyboardOffsetView];
    self.view.keyboardGap = 10; // 如果需要自定义键盘与第一响应者之间的间隙，则设置此属性，默认为5
    
    self.view.keyboardOffsetViewDelegate = self;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // 关闭键盘补偿视图
    [self.view closeKeyboardOffsetView];
}

/**
 *  弹出键盘时，自定义视图向上移动的高度
 *
 *  @param firstResponder 第一响应者
 *  @param keyboardHeight 当前弹出键盘的高度
 *  @param offsetHeight   默认偏移高度
 *
 *  @return 视图向上移动的高度
 */
- (CGFloat)offsetViewHeightWithFirstResponder:(UIView *)firstResponder
                               keyboardHeight:(CGFloat)keyboardHeight
                                 offsetHeight:(CGFloat)offsetHeight
{
    if ([firstResponder isEqual:_testTextField])
    {
        return keyboardHeight;
    }
    return offsetHeight;
}


/**
 *  点击视图收起键盘
 *
 *  @param gesture 点击视图手势
 */
- (void)tapViewGesture:(UITapGestureRecognizer *)gesture
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
