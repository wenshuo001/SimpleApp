//
//  GTSplashView.m
//  SimpleApp
//
//  Created by 库兹马 on 2020/9/7.
//  Copyright © 2020 Wenshuo. All rights reserved.
//

#import "GTSplashView.h"
#import "GTScreen.h"

@interface GTSplashView ()

@property(nonatomic,strong,readwrite)UIButton *button;
@property(nonatomic,strong,readwrite)UIImageView *imageView;
@end

@implementation GTSplashView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        self.image = [UIImage imageNamed:@"icon.bundle/remmber_water2.png"];
        [self addSubview:({
            // _imageView = [UIImage imageNamed:@"icon.bundle/splash_tip.png"];
            _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(UI(30), frame.size.height/2-UI(50)/2, frame.size.width-UI(60),UI(50))];
            [_imageView setImage:[UIImage imageNamed:@"icon.bundle/splash_tip.png"]];
            _imageView;
        })];
        
        [self addSubview:({
            _button = [[UIButton alloc] initWithFrame:UIRect(330,100,60,40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
        
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)_removeSplashView{
    [self removeFromSuperview];
}

@end
