//
//  CardTypeChooseVc.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/24.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "CardTypeChooseVc.h"
#import "Card.h"
#import "BankChooseCell.h"

@interface CardTypeChooseVc ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) XTableView *tableView;
@property (nonatomic, strong) NSArray *bankArray;

@end

@implementation CardTypeChooseVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bankArray = [[CardManager sharedManager] bankList];
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.bankArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BankChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:[BankChooseCell className]];
    cell.bank = self.bankArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didChooseBank:)]) {
        [self.delegate didChooseBank:self.bankArray[indexPath.row]];
    }
    [self.navigationController popViewControllerAnimated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (XTableView *)tableView {
    if (!_tableView) {
        _tableView = [XTableView viewWithDelegate:self dataSource:self];
        [_tableView registerClass:[BankChooseCell class] forCellReuseIdentifier:[BankChooseCell className]];
        _tableView.separatorColor = ThemeColor2;
        _tableView.rowHeight = 70;
    }
    return _tableView;
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
