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

@interface AddCardVC ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) NSArray <AddCardItemView *> *items;

@property (nonatomic, strong) UIPickerView *pickerView;
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
        [info addObject:itemView.inputText];
    }
    [[CardManager sharedManager] setInfo:info compltion:^(BOOL success, NSString *errMsg) {
        if (success) {
            [self.navigationController popViewControllerAnimated:NO];
        } else {
            NSLog(@"错误信息:%@",errMsg);
        }
    }];
}

- (void)addViews {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];

    NSArray *array = [Card propertyAarray];
    UIView *previousView = nil;
    NSMutableArray *items = [NSMutableArray array];
    [self.view addSubview:self.contentView];
    
    for (NSString *str in array) {
        AddCardItemView *item = [AddCardItemView viewWithTitle:str];
        [self.contentView addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            if (previousView) {
                make.top.equalTo(previousView.mas_bottom).offset(10.f);
            } else {
                make.top.equalTo(self.contentView).offset(10.f);
            }
            make.leading.trailing.equalTo(self.contentView);
        }];
        if ([array indexOfObject:item] > 4 ) {
            __weak typeof(self) weak = self;
            item.beginEditingBlock = ^(UITextField *tf) {
//                tf.inputView = weak.pickerView;
//                [tf becomeFirstResponder];
//                [self.pickerView becomeFirstResponder];
//                [weak offset:tf];
                [self.contentView setContentOffset:CGPointMake(0, -50) animated:YES];
            };
        }
        [items addObject:item];
        previousView = item;
    }
    self.items = items;
}

#pragma mark - keyboardWillChangeFrameNotification
- (void)keyboardWillChangeFrame:(NSNotification *)noti {
    CGRect keyboardEndFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //    UIViewAnimationCurve curve = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    CGFloat kh = 0;
    if (keyboardEndFrame.origin.y == SCREEN_HEIGHT) {
        kh = 0;
        int offset = keyboardEndFrame.origin.y + keyboardEndFrame.size.height - (self.view.frame.size.height - kh);
//        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    } else {
        kh = keyboardEndFrame.size.height;
//        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[Card nameAarray] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [Card nameAarray][row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"choose ---- %@",[Card nameAarray][row]);
}

- (UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.frame = CGRectMake(0, self.view.height - 150, self.view.width, 150);
        _pickerView.showsSelectionIndicator = YES;
        [self.view addSubview:_pickerView];
    }
    return _pickerView;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        
    }
    return _contentView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
