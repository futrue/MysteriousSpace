//
//  DataCenterVC.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "DataCenterVC.h"
#import "CardInfoCell.h"

@interface DataCenterVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) XTableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation DataCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[CardManager sharedManager] allCards];

    self.view.backgroundColor = COLOR_BACKGROUND;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshAction)];
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);

}

- (void)refreshAction {
    NSArray *arr = [[CardManager sharedManager] allCards];
    self.dataArray = arr;
    NSLog(@"我的卡%@",arr);
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CardInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:[CardInfoCell className]];
    cell.card = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (XTableView *)tableView {
    if (!_tableView) {
        _tableView = [XTableView viewWithDelegate:self dataSource:self];
        [_tableView registerClass:[CardInfoCell class] forCellReuseIdentifier:[CardInfoCell className]];
        _tableView.separatorColor = ThemeColor2;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 80;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


@end
