# CLKeyboardOffsetView 1.0
键盘补偿视图工具，为了避免弹出的键盘遮挡输入框，向上移动视图

<br />
作者：李辉 <br />
联系方式：6545823@qq.com <br />
编译环境：Xcode 7.2 <br />
运行环境：iOS 9.2 运行正常 <br />
您在使用该控件的过程中，如有任何疑问或建议，请通过邮箱联系我，谢谢！ <br />

<br />
![image](https://github.com/changelee82/CLKeyboardOffsetView/raw/master/Demo.gif)
<br />

使用方法
===============

  #import "UIView+CLKeyboardOffsetView.h"
    
  - (void)viewDidAppear:(BOOL)animated
  {
    [super viewDidAppear:animated];
    
    // 打开键盘补偿视图
    [self.view openKeyboardOffsetView];
    self.view.keyboardGap = 10; // 如果需要自定义键盘与第一响应者之间的间隙，则设置此属性，默认为5
  }

  - (void)viewDidDisappear:(BOOL)animated
  {
    [super viewDidDisappear:animated];
    
    // 关闭键盘补偿视图
    [self.view closeKeyboardOffsetView];
  }
  
  如果需要自定义视图向上移动的高度，则使用代理 
  <CLKeyboardOffsetViewDelegate>
  self.view.keyboardOffsetViewDelegate = self;
  并添加代理方法
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


详细的示例请参考代码。 <br />

历史版本
===============
v1.0 - 2015-12-23 <br />
Added <br />
基础功能完成 <br />
