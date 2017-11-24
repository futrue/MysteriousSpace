//
//  XNavgationController.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "XNavgationController.h"

@interface XNavgationController ()

@end

@implementation XNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance].barTintColor = ThemeColor2;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // 判断下是否是根控制器
    
    if (self.childViewControllers.count != 0) { // 非根控制器
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置导航条左边的按钮
        self.navigationItem.hidesBackButton = NO;
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self backBarButton]];
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

// 返回到上一个界面
- (void)back {
    [self popViewControllerAnimated:YES];
}

- (UIButton *)backBarButton {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"iconMaskBack"] forState:UIControlStateNormal];
    backButton.size = backButton.intrinsicContentSize;
    backButton.backgroundColor = COLOR_WHITE;
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    return backButton;
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

@end
