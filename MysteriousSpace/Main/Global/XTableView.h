//
//  XTableView.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/22.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTableView : UITableView
+ (XTableView *)viewWithDelegate:(id <UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource;
@end
