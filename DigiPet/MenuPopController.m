//
//  MenuPopController.m
//
//  Created by Franky Wu on 2016/1/28.
//  Copyright © 2016年 Franky Wu. All rights reserved.
//

#import "MenuPopController.h"
#import <QuartzCore/QuartzCore.h>
#import "MenuTableViewCell.h"

@interface MenuPopController()
@property (weak,nonatomic) IBOutlet UITableView *menuTable;
@property (copy,nonatomic) NSArray *menuItems;
@end

@implementation MenuPopController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.menuTable.rowHeight = UITableViewAutomaticDimension;
    self.menuTable.layer.cornerRadius = 5;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOffset = CGSizeMake(4,4);//陰影偏移量
    self.view.layer.shadowOpacity = 0.8;//陰影透明度
    self.view.layer.shadowRadius = 4;//陰影半徑
}

#pragma mark - PopAnimation
- (void)showAnimate {
    self.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    self.view.alpha = 0;
    [UIView animateWithDuration:.25 animations:^{
        self.view.alpha = 1;
        self.view.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)removeAnimate {
    [UIView animateWithDuration:.25 animations:^{
        self.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
        }
    }];
}

#pragma mark - Action Methods
- (void)popMenuPopover:(UIButton *)sender atView:(UIViewController *)aView withMenu:(NSArray *)menulist animated:(BOOL)animated {
    self.menuItems = menulist;
    
    CGFloat tableHeight = [self.menuItems count] * 44;
    self.view.frame = CGRectMake(sender.frame.origin.x,
                                 sender.frame.origin.y - (tableHeight + 5),
                                 100,
                                 tableHeight);

    [self willMoveToParentViewController:aView];
    [aView.view addSubview:self.view];
    [aView addChildViewController:self];
    [self didMoveToParentViewController:aView];
    
    if (animated) {
        [self showAnimate];
    }
}

- (void)dismissMenuPopover {
    [self removeAnimate];
}

#pragma mark - TableView delegate & datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"feedCell";
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.foodLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"%ld %@",(long)indexPath.row,[self.menuItems objectAtIndex:indexPath.row]);
    [self removeAnimate];
}


@end
