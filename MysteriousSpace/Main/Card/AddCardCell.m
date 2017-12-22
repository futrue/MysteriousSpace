//
//  AddCardCell.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/12/21.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "AddCardCell.h"

@interface AddCardCell ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desclabel;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, assign) NSInteger textFieldMaxLength;
@property (nonatomic, strong) NSString *placeholder;
@end

@implementation AddCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupUI {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.desclabel];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.offset(15.f);
        make.centerY.equalTo(self.contentView);
     }];
    
    [self.desclabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-15.f);
        make.centerY.equalTo(self.contentView);
    }];

    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.titleLabel.mas_trailing).offset(20);
        make.trailing.equalTo(self.contentView).offset(-15.f);
        make.height.equalTo(@(35));
    }];
    
    [self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(SCREEN_WIDTH, 45);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setCard:(Card *)card {
    _card = card;
    if (card) {
        
    }
}


- (void)setTitle:(NSString *)title desc:(NSString *)desc {
    NSArray *array = @[@"姓名",@"卡号",@"卡类型",@"绑定手机号",@"登录密码",@"支付密码",@"身份证号",@"图片"];
    self.titleLabel.text = title;
    self.desclabel.text = desc;
    self.textField.hidden = desc.length > 0;

    if ([title isEqualToString:array[0]]) {
        self.textFieldMaxLength = 4;
        self.placeholder = title;
        self.textField.keyboardType = UIKeyboardTypeDefault;
    } else if ([title isEqualToString:array[1]]) {
        self.textFieldMaxLength = 19;
        self.placeholder = [NSString stringWithFormat:@"银行%@",title];
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
    } else if ([title isEqualToString:array[2]]) {
//        self.textFieldMaxLength = 10;
        self.textField.hidden = YES;
        self.placeholder = [NSString stringWithFormat:@"银行%@",title];
        self.textField.keyboardType = UIKeyboardTypeDefault;
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
        self.textFieldMaxLength = 18;
        self.placeholder = title;
        self.textField.keyboardType = UIKeyboardTypeNamePhonePad;
    } else {
        self.textFieldMaxLength = 10;
        self.placeholder = @"";
        self.textField.hidden = YES;
    }
    self.textField.placeholder = [NSString stringWithFormat:@"请输入%@",self.placeholder];
    self.desclabel.hidden = self.desclabel.text.length == 0;

    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}
- (NSString *)currentText {
    if (self.desclabel.text) {
        return self.desclabel.text;
    }
    if (self.textField.text) {
        return self.textField.text;
    }
    return @"";
}
- (NSString *)placeholder {
    if (self.textField.placeholder) {
        return self.textField.placeholder;
    }
    return @"信息不完整";

}
- (void)textFieldTextDidChange:(NSNotification *)noti {
//    _inputText = self.textField.text ? : @"";
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    if (self.beginEditingBlock) {
//        [textField resignFirstResponder];
//        self.beginEditingBlock();
//    }
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
        _titleLabel.textColor = XRGB(49, 4F, 61);
    }
    return _titleLabel;
}

- (UILabel *)desclabel {
    if (!_desclabel) {
        _desclabel = [[UILabel alloc] init];
        _desclabel.textAlignment = NSTextAlignmentRight;
        _desclabel.textColor = COLOR_TEXT_CONTENT;
    }
    return _desclabel;
}

- (UITextField *)textField {
    if (!_textField) {
        // http://www.jianshu.com/p/fe95f7e64b89
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
//        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.placeholder = [NSString stringWithFormat:@"请输入%@",self.placeholder];
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.textColor = COLOR_TEXT_CONTENT;
        _textField.font = FONT(14);
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;//是否纠错
        _textField.returnKeyType = UIReturnKeyDone;//return键变成什么键
        _textField.keyboardAppearance = UIKeyboardAppearanceDark;//键盘外观
        
    }
    return _textField;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
