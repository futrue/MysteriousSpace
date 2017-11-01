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
    [UINavigationBar appearance].barTintColor = GPBgColor;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // 判断下是否是根控制器
    
    if (self.childViewControllers.count != 0) { // 非根控制器
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置导航条左边的按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回 " style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

// 返回到上一个界面
- (void)back {
    [self popViewControllerAnimated:YES];
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
