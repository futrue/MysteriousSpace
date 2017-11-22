//
//  XTableView.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/22.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "XTableView.h"

@implementation XTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableFooterView = nil;
    }
    return self;
}
@end
