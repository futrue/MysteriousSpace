//
//  XTableView.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/22.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "XTableView.h"

@implementation XTableView

+ (XTableView *)viewWithDelegate:(id <UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource {
    return [[XTableView alloc] initWithDelegate:delegate dataSource:dataSource];
}

- (instancetype)initWithDelegate:(id <UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource {
    self = [super init];
    if (self) {
        self.tableFooterView = nil;
        self.delegate = delegate;
        self.dataSource = dataSource;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableFooterView = nil;
    }
    return self;
}

@end
