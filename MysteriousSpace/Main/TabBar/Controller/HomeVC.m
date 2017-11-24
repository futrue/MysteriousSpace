//
//  HomeVC.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "HomeVC.h"
#import "AddCardVC.h"
#import "AddBillVC.h"
@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) XTableView *tableView;
@property (nonatomic, strong) NSArray *typeArray;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.typeArray = @[@"添加卡",@"添加账单",@"添加其他"];
    self.view.backgroundColor = COLOR_BACKGROUND;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCardAction)];
    [self.view addSubview:self.tableView];
}

- (void)addCardAction {
    AddCardVC *vc = [[AddCardVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addBillAction {
    AddBillVC *vc = [[AddBillVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.textLabel.text =  self.typeArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self addCardAction];
            break;
        case 1:
            [self addBillAction];
            break;

        default:

            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (XTableView *)tableView {
    if (!_tableView) {
        _tableView = [[XTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
