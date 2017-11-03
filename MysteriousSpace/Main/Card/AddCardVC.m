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

@interface AddCardVC ()
@property (nonatomic, strong) NSArray <AddCardItemView *> *items;
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
    [self.navigationController popViewControllerAnimated:NO];
    
    NSMutableArray *info = [NSMutableArray array];
    for (AddCardItemView *itemView in self.items) {
        [info addObject:itemView.inputText];
    }
    Card *card = [[Card alloc] init];
    [card setInfo:info];
    [[CardManager sharedManager] addCard:card];
}

- (void)addViews {
    NSArray *array = [Card propertyAarray];
    UIView *previousView = nil;
    NSMutableArray *items = [NSMutableArray array];
    for (NSString *str in array) {
        AddCardItemView *item = [AddCardItemView viewWithTitle:str];
        [self.view addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            if (previousView) {
                make.top.equalTo(previousView.mas_bottom).offset(10.f);
            } else {
                make.top.equalTo(self.view).offset(74.f);
            }
            make.leading.equalTo(self.view);
        }];
        [items addObject:item];
        previousView = item;
    }
    self.items = items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
