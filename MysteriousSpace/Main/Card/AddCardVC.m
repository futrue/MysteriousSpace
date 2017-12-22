//
//  AddCardVC.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/2.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "AddCardVC.h"
#import "AddCardItemView.h"
#import "Card.h"
#import "CardTypeChooseVc.h"

@interface AddCardVC ()<CardChooseProtocol>{
    CGFloat _totalYOffset;
}
@property (nonatomic, strong) NSArray <AddCardItemView *> *items;
@property (nonatomic, strong) UIScrollView *contentView;
@end

@implementation AddCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加";
    self.view.backgroundColor = COLOR_BACKGROUND;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction)];
    [self addViews];
}

- (void)saveAction {
    NSMutableArray *info = [NSMutableArray array];
    for (AddCardItemView *itemView in self.items) {
        if (itemView.card) {
//            [info addObject:@(itemView.card.type)];
        } else {
            if (itemView.inputText.length) {
                [info addObject:itemView.inputText];
            } else {
                [info addObject:@"---"];
            }
        }
    }
//    [[CardManager sharedManager] setInfo:info compltion:^(BOOL success, NSString *errMsg) {
//        if (success) {
//            [self.navigationController popViewControllerAnimated:NO];
//        } else {
//            NSLog(@"错误信息:%@",errMsg);
//        }
//    }];
    [self.view endEditing:YES];
}

- (void)addViews {
    NSArray *array = [Card propertyAarray];
    NSMutableArray *items = [NSMutableArray array];
    [self.view addSubview:self.contentView];
    
    __block UIView *previousView = nil;
    __block CGFloat contentSizeHeight = 0;
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AddCardItemView *item = [AddCardItemView viewWithTitle:obj];
        item.frame = CGRectMake(0, previousView ? previousView.bottom + 10 : 10, self.contentView.width, item.height);
        [self.contentView addSubview:item];
        [items addObject:item];
        if (idx == 2) {
            item.beginEditingBlock = ^() {
                CardTypeChooseVc *vc = [[CardTypeChooseVc alloc] init];
                vc.delegate = self;
                [self.navigationController pushViewController:vc animated:YES];
            };
        }
        previousView = item;
        contentSizeHeight = previousView.maxY + 10;
    }];
    self.contentView.contentSize = CGSizeMake(self.view.width, contentSizeHeight);
    self.items = items;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow * window in windows) {
        if ([NSStringFromClass([window class]) isEqualToString:@"UIRemoteKeyboardWindow"]) {
            window.hidden = YES;
        }
    }
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -  CardChooseProtocol
- (void)didChooseBank:(BankEntity *)bank {
    [self.items[2] setInputText:[NSString stringWithFormat:@"%@[%@]",bank.bank_name,bank.bank_ename]];
}

#pragma mark - keyboardWillChangeFrameNotification
- (void)keyboardWillChangeFrame:(NSNotification *)noti {
    // 键盘相关
    CGRect keyboardEndFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    CGFloat keyboardH = keyboardEndFrame.size.height;
    CGFloat keyboardY = keyboardEndFrame.origin.y;
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions curve = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    // 响应者View相关
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponderView = [keyWindow performSelector:@selector(findFirstResponder)];
    CGRect rect = [[UIApplication sharedApplication].keyWindow convertRect:firstResponderView.frame fromView:firstResponderView.superview];
    CGFloat firstResponderViewBottom = rect.origin.y + rect.size.height;

    [UIView animateWithDuration:duration delay:0 options:curve animations:^{
        if (keyboardEndFrame.origin.y == SCREEN_HEIGHT) {// 收起键盘
            self.view.y = 0;
            _totalYOffset = 0;
        } else {// 弹起键盘
            if (firstResponderViewBottom > keyboardY) {
                _totalYOffset += firstResponderViewBottom - keyboardY;
                self.view.y -= _totalYOffset;
            } else {
                
            }
        }
    } completion:nil];
    
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 216 - 64)];
    }
    return _contentView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
