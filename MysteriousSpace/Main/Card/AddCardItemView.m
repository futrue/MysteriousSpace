//
//  AddCardItemView.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/2.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "AddCardItemView.h"
#import "Card.h"

@interface AddCardItemView ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, assign) NSInteger textFieldMaxLength;
@property (nonatomic, strong) NSString *placeholder;

@end

@implementation AddCardItemView

+ (AddCardItemView *)viewWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
        [self setupUI];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    NSArray *array = [Card propertyAarray];
    if ([title isEqualToString:array[0]]) {
        self.textFieldMaxLength = 4;
        self.placeholder = title;
        self.textField.keyboardType = UIKeyboardTypeDefault;
    } else if ([title isEqualToString:array[1]]) {
        self.textFieldMaxLength = 19;
        self.placeholder = [NSString stringWithFormat:@"银行%@",title];
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    } else if ([title isEqualToString:array[2]]) {
        self.textFieldMaxLength = 10;
        self.placeholder = [NSString stringWithFormat:@"银行%@",title];
        self.textField.keyboardType = UIKeyboardTypeEmailAddress;
    } else if ([title isEqualToString:array[3]]) {
        self.textFieldMaxLength = 11;
        self.placeholder = @"预留手机号码";
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    } else if ([title isEqualToString:array[4]]) {
        self.textFieldMaxLength = 6;
        self.placeholder = title;
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    } else if ([title isEqualToString:array[5]]) {
        self.textFieldMaxLength = 6;
        self.placeholder = title;
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    } else if ([title isEqualToString:array[6]]) {
        self.textFieldMaxLength = 1000;
        self.placeholder = title;
    } else if ([title isEqualToString:array[7]]) {
        self.textFieldMaxLength = 18;
        self.placeholder = title;
        self.textField.keyboardType = UIKeyboardTypeNamePhonePad;
    } else {
        self.textFieldMaxLength = 10;
        self.placeholder = @"请输入";
    }
}

- (void)setInputText:(NSString *)inputText {
    _inputText = inputText;
    self.textField.text = inputText;
}

- (void)setCard:(Card *)card {
    _card = card;
    self.textField.text = [NSString stringWithFormat:@"%@[%@]",card.chianeseName,card.abbreviationName];
}


- (void)setupUI {
    self.backgroundColor = COLOR_WHITE;
    [self addSubview:self.titleLabel];
    [self addSubview:self.textField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    _titleLabel.text = self.title;
    self.size = CGSizeMake(SCREEN_WIDTH, 45);
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(15.f);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(self.titleLabel.intrinsicContentSize.width);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleLabel.mas_trailing).offset(10.f);
        make.centerY.equalTo(self);
        make.trailing.equalTo(self).offset(-15.f);
        make.height.equalTo(@(35));
    }];
    
    [self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(SCREEN_WIDTH, 45);
}

- (void)textFieldTextDidChange:(NSNotification *)noti {
    _inputText = self.textField.text ? : @"";
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.beginEditingBlock) {
        [textField resignFirstResponder];
        self.beginEditingBlock();
    }
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    NSLog(@"--changed----%@",textField.text);
//
//    NSString* number= Knum;
//    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
//    return [numberPre evaluateWithObject:string];
//
//    if (textField.text.length > maxInputLength) {
//        return NO;
//    }
//
//    return YES;
//}   // return NO to not change text

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    //string就是此时输入的那个字符 textField就是此时正在输入的那个输入框 返回YES就是可以改变输入框的值 NO相反
    
    if ([string isEqualToString:@"n"]) //按会车可以改变
    {
        return YES;
    }
    
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
    
    if (self.textField == textField) //判断是否时我们想要限定的那个输入框
    {
        if ([toBeString length] > self.textFieldMaxLength)
        {   //如果输入框内容大于最大长度则不再输入
            textField.text = [toBeString substringToIndex:self.textFieldMaxLength];
            return NO;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}              // called when 'return' key pressed. return NO to ignore.


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(15);
    }
    return _titleLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        // http://www.jianshu.com/p/fe95f7e64b89
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.placeholder = [NSString stringWithFormat:@"请输入%@",self.placeholder];
        _textField.textColor = COLOR_TEXT_CONTENT;
        _textField.font = FONT(14);
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
        _textField.returnKeyType = UIReturnKeyDone;//return键变成什么键
        _textField.keyboardAppearance = UIKeyboardAppearanceDark;//键盘外观

    }
    return _textField;
}

@end
