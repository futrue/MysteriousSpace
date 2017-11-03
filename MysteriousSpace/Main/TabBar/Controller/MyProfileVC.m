//
//  MyProfileVC.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "MyProfileVC.h"
#import "UserInfoView.h"

@interface MyProfileVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UserInfoView *userInfoView;

@property (nonatomic, strong) UIButton *exitButton;

@end

@implementation MyProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BACKGROUND;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 10)];
        view.backgroundColor = COLOR_BACKGROUND;
        return view;
    }
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
        self.exitButton.frame = CGRectMake(20, 30, self.view.width - 40, 30);
        [view addSubview:self.exitButton];
        return view;
    }
    return [UIView new];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section) {
        return 10.f;
    }
    return 0.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 60;
    }
    return 0.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger index = section;
    if (index == 0) {
        return 1;
    } else if (index == 1) {
        return 3;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.section;
    if (index == 0) {
        return [self.userInfoView systemLayoutSizeFittingSize:CGSizeZero].height;
    } else if (index == 1) {
        return 44;
    } else {
        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuserID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = FONT(15);
    }
    if (indexPath.section == 1) {
        NSArray *arr = @[@"编辑个人资料" ,@"安全", @"隐私"];
        cell.textLabel.text = arr[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.section == 2) {
        cell.textLabel.text = indexPath.row == 0 ? @"设置" : @"关于";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        [cell.contentView addSubview:self.userInfoView];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"点击了:%@",cell.textLabel.text);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)logout:(UIButton *)sender {
    NSLog(@"点击了退出");
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _tableView.tableFooterView = [UIView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (UserInfoView *)userInfoView {
    if (!_userInfoView) {
        _userInfoView = [[UserInfoView alloc] init];
    }
    return _userInfoView;
}

- (UIButton *)exitButton {
    if (!_exitButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = ThemeColor;
        button.layer.cornerRadius = 4.f;
        [button setTitle:@"退出" forState:UIControlStateNormal];
        [button setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
        [button addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
        _exitButton = button;
    }
    return _exitButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
