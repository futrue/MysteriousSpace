//
//  AddCardItemView.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/2.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCardItemView : UIView

+ (AddCardItemView *)viewWithTitle:(NSString *)title;
@property(nonatomic, copy, readonly) NSString *title;
@property(nonatomic, copy) NSString *inputText;
@property(nonatomic, copy) void (^beginEditingBlock)(UITextField *tf);
@property (nonatomic, strong, readonly) UITextField *textField;
@end
