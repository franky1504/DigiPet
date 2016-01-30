//
//  MenuPopController.h
//
//  Created by Franky Wu on 2016/1/28.
//  Copyright © 2016年 Franky Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuPopController : UIViewController <UITableViewDataSource,UITableViewDelegate>

- (void)dismissMenuPopover;

- (void)popMenuPopover:(UIButton *)sender atView:(UIViewController *)aView withMenu:(NSArray *)menulist animated:(BOOL)animated;

@end
