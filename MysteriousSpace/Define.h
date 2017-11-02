//
//  Define.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


#define BgColor [UIColor colorWithRed:255/255.f green:122/255.f blue:63/255.f alpha:1]
#define COLOR_BACKGROUND RGB(245, 245, 245)
#define COLOR_LINE RGB(236, 236, 236)
#define COLOR_PLACEHOLDER RGB(179, 179, 179)
#define COLOR_WHITE RGB(255, 255, 255)
#define COLOR_TEXT_CONTENT RGB(102, 102, 102)
#define COLOR_PRIMARY RGB(255, 122, 63)
#define ThemeColor [UIColor colorWithRed:0.92 green:0.34 blue:0.32 alpha:1]
#define RandomColor [UIColor colorWithRed:(random()%255)/255.0 green:(random()%255)/255.0 blue:(random()%255)/255.0 alpha:1]

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define XRGB(r,g,b) [UIColor colorWithRed:(0x##r)/255.0 green:(0x##g)/255.0 blue:(0x##b)/255.0 alpha:1]
#define XRGBA(r,g,b,a) [UIColor colorWithRed:(0x##r)/255.0 green:(0x##g)/255.0 blue:(0x##b)/255.0 alpha:(a)]



/** 正常字体 */
#define FONT(fontSize) ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f) ? [UIFont fontWithName:@"Helvetica" size:fontSize] : [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize]
/** 粗体 */
#define FONT_BOLD(fontSize) ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f) ? [UIFont fontWithName:@"Helvetica-Bold" size:fontSize] : [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize]
/** 细体 */
#define FONT_LIGHT(fontSize)  ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f) ? [UIFont fontWithName:@"Helvetica-Light" size:fontSize] : [UIFont fontWithName:@"PingFangSC-Light" size:fontSize]


#define TEST_IMG [UIImage imageNamed:@"test.jpg"]
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)

#endif /* Define_h */
