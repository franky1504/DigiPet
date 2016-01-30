//
//  MenuIconController.m
//  DigiPet
//
//  Created by i_feyuwu on 2016/1/25.
//  Copyright © 2016年 FrankyWu. All rights reserved.
//

#import "MenuIconController.h"

static MenuIconController *manager = nil;

@implementation MenuIconController

+ (MenuIconController *)manager {
    if (nil != manager) {
        return manager;
    }
    
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [MenuIconController new];
    });
    
    return manager;
}

- (void)initMenuIcon:(UIView *)buttomView {
    UIButton *icon1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    icon1.frame = CGRectMake(ICON_PADDING, SCREEN_HEIGHT-(ICON_PADDING+ICON_SIZE), ICON_SIZE, ICON_SIZE);
    icon1.backgroundColor = [UIColor redColor];
    [icon1 setTitle:@"餵食" forState:(UIControlState)UIControlStateNormal];
    [icon1 addTarget:self action:@selector(doIcon1) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    [buttomView addSubview:icon1];
    
    UIButton *icon2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    icon2.frame = CGRectMake(ICON_PADDING*2+ICON_SIZE, SCREEN_HEIGHT-(ICON_PADDING+ICON_SIZE), ICON_SIZE, ICON_SIZE);
    icon2.backgroundColor = [UIColor redColor];
    [icon2 setTitle:@"遊戲" forState:(UIControlState)UIControlStateNormal];
    [icon2 addTarget:self action:@selector(doIcon2) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    [buttomView addSubview:icon2];
    
    UIButton *icon3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    icon3.frame = CGRectMake(ICON_PADDING*3+ICON_SIZE*2, SCREEN_HEIGHT-(ICON_PADDING+ICON_SIZE), ICON_SIZE, ICON_SIZE);
    icon3.backgroundColor = [UIColor redColor];
    [icon3 setTitle:@"對戰" forState:(UIControlState)UIControlStateNormal];
    [icon3 addTarget:self action:@selector(doIcon3) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    [buttomView addSubview:icon3];
    
    UIButton *icon4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    icon4.frame = CGRectMake(ICON_PADDING*4+ICON_SIZE*3, SCREEN_HEIGHT-(ICON_PADDING+ICON_SIZE), ICON_SIZE, ICON_SIZE);
    icon4.backgroundColor = [UIColor redColor];
    [icon4 setTitle:@"設定" forState:(UIControlState)UIControlStateNormal];
    [icon4 addTarget:self action:@selector(doIcon4) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    [buttomView addSubview:icon4];
}

- (void)doIcon1 {
    NSLog(@"餵食");
}

- (void)doIcon2 {
    NSLog(@"遊戲");
}

- (void)doIcon3 {
    NSLog(@"對戰");
}

- (void)doIcon4 {
    NSLog(@"設定");
}
@end
