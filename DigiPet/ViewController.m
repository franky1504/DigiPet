//
//  ViewController.m
//  DigiPet
//
//  Created by Franky Wu on 2016/1/14.
//  Copyright © 2016年 Franky Wu. All rights reserved.
//

#import "ViewController.h"
#import "PetMoveController.h"
#import "MenuPopController.h"

@interface ViewController ()

@property (strong,nonatomic) IBOutlet PetMoveController *petView;
@property (weak,nonatomic) MenuPopController *menuView;
@property (weak,nonatomic) UIButton *currentBtn;

@end

@implementation ViewController
@synthesize petView,menuView,currentBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initVariables];
    [self initModalManagers];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init ViewUI & Variables
- (void)initVariables {
    currentBtn = nil;
}

- (void)initModalManagers {
    petView = [PetMoveController manager];
}

#pragma mark - Menu Methods
- (IBAction)showFeedMenu:(UIButton *)sender {
    [menuView dismissMenuPopover];
    if (sender == currentBtn) {
        currentBtn = nil;
    } else {
        menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuPop"];
        [menuView popMenuPopover:sender atView:self withMenu:@[@"香蕉",@"蘋果",@"拔剌"] animated:YES];
        currentBtn = sender;
    }
}

- (IBAction)showGameMenu:(UIButton *)sender {
    [menuView dismissMenuPopover];
    if (sender == currentBtn) {
        currentBtn = nil;
    } else {
        menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuPop"];
        [menuView popMenuPopover:sender atView:self withMenu:@[@"籃球",@"跑步"] animated:YES];
        currentBtn = sender;
    }
}

- (IBAction)showBattleMenu:(UIButton *)sender {
    [menuView dismissMenuPopover];
    if (sender == currentBtn) {
        currentBtn = nil;
    } else {
        menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuPop"];
        [menuView popMenuPopover:sender atView:self withMenu:@[@"尋找對手"] animated:YES];
        currentBtn = sender;
    }
}

- (IBAction)showSettingMenu:(UIButton *)sender {
    [menuView dismissMenuPopover];
    if (sender == currentBtn) {
        currentBtn = nil;
    } else {
        menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuPop"];
        [menuView popMenuPopover:sender atView:self withMenu:@[@"圖鑑",@"商店",@"寵物資訊"] animated:YES];
        currentBtn = sender;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [menuView dismissMenuPopover];
}

@end
