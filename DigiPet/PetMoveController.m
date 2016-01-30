//
//  PetMoveController.m
//  DigiPet
//
//  Created by i_feyuwu on 2016/1/15.
//  Copyright © 2016年 FrankyWu. All rights reserved.
//

#import "PetMoveController.h"

@interface PetMoveController() <UIGestureRecognizerDelegate>
@property (strong,nonatomic) UIImageView *gifImg;
@property (assign,nonatomic) CGFloat petX;
@property (assign,nonatomic) CGFloat petY;
@end

static PetMoveController *manager = nil;

@implementation PetMoveController
@synthesize gifImg,petX,petY;

+ (PetMoveController *)manager {
    if (nil != manager) {
        return manager;
    }
    
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [PetMoveController new];
    });
    
    return manager;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initWithCoder");
        self.backgroundColor = [UIColor clearColor];
        petX = self.frame.size.width/2;
        petY = self.frame.size.height/2;
        
        gifImg = [[UIImageView alloc] initWithFrame:CGRectMake(petX - petImgWidth/2,
                                                               petY - petImgHeight/2,
                                                               petImgWidth,
                                                               petImgHeight)];
        gifImg.image = [UIImage animatedImageNamed:@"stay-" duration:1.0f];
        gifImg.userInteractionEnabled = YES;
        
        [self addSubview:gifImg];
        [self addPetTapGesture];
    }
    return self;
}

- (void)addPetTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(movePetWithTap:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.delegate = self;
    [gifImg addGestureRecognizer:tapGesture];
}

- (void)movePetWithTap:(id)sender {
    [self movePetWithPathX:[self randomOffsetX] andPathY:[self randomOffsetY]];
}

- (int)randomOffsetX {
    int x;
    int retX;
    
    do {
        x = (arc4random() % 50) + 30;
        retX = x % 2 ? -x : x;
        //NSLog(@"X:%f",petX+retX);
    } while (petX+retX < petImgWidth || petX+retX > SCREEN_WIDTH-petImgWidth);
    
    return retX;
}

- (int)randomOffsetY {
    int y;
    int retY;
    
    do {
        y = (arc4random() % 50) + 30;
        retY = y % 2 ? -y : y;
        //NSLog(@"Y:%f",petY+retY);
    } while (petY+retY < petImgHeight || petY+retY > (SCREEN_HEIGHT-ICON_SIZE)-petImgHeight);
    
    return retY;
}

- (void)movePetWithPathX:(int)moveX andPathY:(int)moveY {
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
    [trackPath moveToPoint:CGPointMake(petX,petY)];
    
    petX = petX + moveX;
    petY = petY + moveY;
    [trackPath addLineToPoint:CGPointMake(petX ,petY)];
    
    [gifImg.layer setPosition:CGPointMake(petX ,petY)];
    [self.layer addSublayer:gifImg.layer];
    
    CAKeyframeAnimation *moveAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAni.path = trackPath.CGPath;
    moveAni.repeatCount = 1;
    moveAni.duration = 0.5;
    moveAni.delegate = self;
    [gifImg.layer addAnimation:moveAni forKey:@"race"];
    NSLog(@"(%.f,%.f)",petX,petY);
}

- (void)animationDidStart:(CAAnimation *)anim {
    [self addMovingGif];
}
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    [self removeMovingGif];
}

- (void)addMovingGif {
    gifImg.image = [UIImage animatedImageNamed:@"giphy-" duration:0.5f];
}
-(void)removeMovingGif {
    gifImg.image = [UIImage animatedImageNamed:@"stay-" duration:1.0f];
}

@end
