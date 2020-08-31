//
//  GTVideoToolbar.m
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/27.
//  Copyright © 2020 Wenshuo. All rights reserved.
//

#import "GTVideoToolbar.h"
#import "GTScreen.h"


@interface GTVideoToolbar ()

@property (nonatomic, strong, readwrite) UIImageView *avatorImageView;
@property (nonatomic, strong, readwrite) UILabel *nickLabel;

@property (nonatomic, strong, readwrite) UIImageView *commentImageView;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;

@property (nonatomic, strong, readwrite) UIImageView *likeImageView;
@property (nonatomic, strong, readwrite) UILabel *likeLabel;

@property (nonatomic, strong, readwrite) UIImageView *shareImageView;
@property (nonatomic, strong, readwrite) UILabel *shareLabel;

@end

@implementation GTVideoToolbar

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            //CGRectZero 是一个高度为零，宽度为零，原点位置也为零，需要创建边框但还不确定边框大小和位置时，可以使用此常量
            _avatorImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _avatorImageView.layer.masksToBounds = YES; //可设置圆角
            _avatorImageView.layer.cornerRadius = 15;  //具体设置圆角
            _avatorImageView.translatesAutoresizingMaskIntoConstraints = NO; //使用约束布局 为NO
            _avatorImageView;
        })];
    }
    return self;
}
 

@end
