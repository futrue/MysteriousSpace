//
//  TabBarVC.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "TabBarVC.h"
#import "MyProfileVC.h"
#import "DataCenterVC.h"
#import "HomeVC.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self addChildsVc];
}

- (void)addChildsVc {
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"HomeVC",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"icon_shiji_",
                                   kSelImgKey : @"icon_shiji_s"},
                                 
                                 @{kClassKey  : @"DataCenterVC",
                                   kTitleKey  : @"卡包",
                                   kImgKey    : @"icon_shougongquan_",
                                   kSelImgKey : @"icon_shougongquan_s"},

                                 @{kClassKey  : @"MyProfileVC",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"icon_wode_",
                                   kSelImgKey : @"icon_wode_s"}];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        
        UIViewController *vc = [[NSClassFromString(dict[kClassKey]) alloc]init];
        vc.title = dict[kTitleKey];
        XNavgationController *nav = [[XNavgationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : ThemeColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
        
    }];
   
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
