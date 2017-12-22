//
//  AddCardViewController.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/12/21.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "AddCardViewController.h"
#import "Card.h"
#import "AddCardCell.h"

static CGFloat keyboardAnimationDuration = 0.25;

@interface AddCardViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray  *dataArray;
@property (nonatomic, strong) NSMutableArray  *descArray;
@end

@implementation AddCardViewController
- (NSMutableArray *)descArray {
    if (!_descArray) {
        _descArray = [NSMutableArray array];
    }
    return _descArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.dataArray = @[@"姓名",@"卡号",@"卡类型",@"绑定手机号",@"登录密码",@"支付密码",@"身份证号",@"图片"];
    Card *card = [[CardManager sharedManager] allCards].count > 0 ? [[[CardManager sharedManager] allCards] firstObject] : nil;
    [self.descArray addObject:card.userName ? : @""];
    [self.descArray addObject:card.number ? : @""];
    [self.descArray addObject:card.bankEntity.bank_name ? : @""];
    [self.descArray addObject:card.phone ? : @""];
    [self.descArray addObject:card.loginPassword ? : @""];
    [self.descArray addObject:card.payPassword ? : @""];
    [self.descArray addObject:card.ID_Num ? : @""];
    [self.descArray addObject:card.imageUrl ? : @""];
    [self.descArray removeAllObjects];
    self.view.backgroundColor = COLOR_BACKGROUND;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction)];

    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    //键盘监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}
- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary *info = [noti userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    keyboardAnimationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGSize keyboardSize = [value CGRectValue].size;
    [UIView animateWithDuration:keyboardAnimationDuration animations:^{
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-keyboardSize.height);
        }];
    }];
}

- (void)keyboardWillHide:(NSNotification *)noti {
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
    }];
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}


- (void)saveAction {
    if (![self cardInfoIsOk]) {
        return;
    }
    [[CardManager sharedManager] addCard:[self cardInfoIsOk] compltion:^(BOOL success, NSString *errMsg) {
        if (success) {
            [self.navigationController popViewControllerAnimated:NO];
        } else {
            NSLog(@"错误信息:%@",errMsg);
        }
    }];
    [self.view endEditing:YES];
}

- (Card *)cardInfoIsOk {
    
    Card *card = [[Card alloc] init];
    __block NSString *errorMsg = @"";
    [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AddCardCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:idx]];
        NSString *string = cell.currentText;
        if (string.length == 0) {
            errorMsg = cell.placeholder;
            *stop = YES;
            return ;
        } 
        switch (idx) {
            case 0:// 姓名
            {
                if (string.length > 6) {
                    errorMsg = @"名字过长";
                } else {
                    
                    card.userName = string;
                }
            }
                break;
            case 1:// 卡号
            {
                if (string.length > 20) {
                    errorMsg = @"卡号过长";
                } else {
                    
                    card.number = string;
                }
            }
                break;
            case 2:// 卡类型
            {
                if (string.length > 20) {
                    errorMsg = @"没有卡类型";
                } else {
                    card.bankEntity.bank_name = string;
                }
            }
                break;
            case 3:// 绑定手机号
            {
                if (string.length > 11) {
                    errorMsg = @"手机号过长";
                } else {
                    
                    card.phone = string;
                }
            }
                break;
            case 4:// 登录密码
            {
                if (string.length > 6) {
                    errorMsg = @"登录密码过长";
                } else {
                    card.loginPassword = string;
                }
            }
                break;
            case 5:// 支付密码
            {
                if (string.length > 2) {
                    errorMsg = @"支付密码过长";
                } else {
                    card.payPassword = string;
                }
            }
                break;
            case 6:// 身份证号
            {
                if (string.length > 18) {
                    errorMsg = @"身份证号过长";
                } else {
                    card.ID_Num = string;
                }
            }
                break;

            default:
                break;
        }
        
    }];
    if (errorMsg.length) {
        NSLog(@"有错误");
    }
    return errorMsg.length == 0 ? card : nil;
    // 卡号
    
    // 卡类型
    
    // 绑定手机号

    // 登录密码
    
    // 支付密码

    // 身份证号
    
    // 图片

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 10)];
    view.backgroundColor = COLOR_BACKGROUND;
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddCardCell *cell = [tableView dequeueReusableCellWithIdentifier:[AddCardCell className]];
    
    if (indexPath.section == 2 || indexPath.section == 7) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSString *desc = [self.descArray count] ? self.descArray[indexPath.section] : @"";
    [cell setTitle:self.dataArray[indexPath.section] desc:desc];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UITableView *)tableView {
    if (!_tableView ) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView registerClass:[AddCardCell class] forCellReuseIdentifier:[AddCardCell className]];
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
