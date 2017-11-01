//
//  GuideTool.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "GuideTool.h"
#import "TabBarVC.h"

#define VersionKey @"curVersion"

@implementation GuideTool

// 加载哪个控制器
+ (UIViewController *)chooseRootViewController
{
    UIViewController *rootVc = nil;
    
    NSDictionary *dict =  [NSBundle mainBundle].infoDictionary;
    
    // 获取最新的版本号
    NSString *curVersion = dict[@"CFBundleShortVersionString"];
    
    // 获取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:VersionKey];
    
    // 之前的最新的版本号 lastVersion
//    if ([curVersion isEqualToString:lastVersion]) {
//        // 版本号相等
//        rootVc = [[GPAdViewController alloc] init];
//    } else { // 有最新的版本号
//        // 保存到偏好设置
//        [[NSUserDefaults standardUserDefaults] setObject:curVersion forKey:VersionKey];
//        rootVc = [[GPNewFeatureController alloc] init];
//    }
    rootVc = [[TabBarVC alloc] init];
    return rootVc;
}

@end
