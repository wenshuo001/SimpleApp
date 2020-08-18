//
//  GtNormalTableViewCell.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/4/7.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "GtNormalTableViewCell.h"

@interface GtNormalTableViewCell()

@property(nonatomic,strong,readwrite) UILabel *titleLable;
@property(nonatomic,strong,readwrite) UILabel *sourceLable;
@property(nonatomic,strong,readwrite) UILabel *contentLable;
@property(nonatomic,strong,readwrite) UILabel *timeLable;
@property(nonatomic,strong,readwrite) UIImageView *rightImageView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;
@end

@implementation GtNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview: ({
            self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
            
            self.titleLable.font = [UIFont systemFontOfSize: 16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable;
        })];
        
        [self.contentView addSubview: ({
            self.sourceLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
            
            self.sourceLable.textColor = [UIColor grayColor];
            self.sourceLable.font = [UIFont systemFontOfSize: 12];
            self.sourceLable;
        })];
        
        [self.contentView addSubview: ({
            self.contentLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
            
            self.contentLable.font = [UIFont systemFontOfSize: 12];
            self.contentLable.textColor = [UIColor grayColor];
            self.contentLable;
        })];
        
        [self.contentView addSubview: ({
            self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
            
            self.timeLable.font = [UIFont systemFontOfSize: 12];
            self.timeLable.textColor = [UIColor grayColor];
            self.timeLable;
        })];
        [self.contentView addSubview: ({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 100, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFill; // IamgeView 显示类型
            self.rightImageView;
        })];
        [self.contentView addSubview: ({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 70, 10, 10)];
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            [self.deleteButton setTitleColor:[UIColor grayColor]forState:UIControlStateNormal];
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];
        
        
    }
    return self;
}

-(void) layouttableViewCell{
    self.titleLable.text = @"这是标题";
    self.sourceLable.text = @"发布人呢";
    [self.sourceLable sizeToFit];
    
    self.contentLable.text = @"18885858585";
     [self.contentLable sizeToFit]; //通过view内容来确定它自己的大小
    self.contentLable.frame = CGRectMake(self.sourceLable.frame.origin.x+self.sourceLable.frame.size.width+15, self.contentLable.frame.origin.y, self.contentLable.frame.size.width, self.contentLable.frame.size.height);
    
    
    self.timeLable.text = @"三分钟前";
     [self.timeLable sizeToFit];  //通过view内容来确定它自己的大小
     self.timeLable.frame = CGRectMake(self.contentLable.frame.origin.x+self.contentLable.frame.size.width+15, self.timeLable.frame.origin.y, self.timeLable.frame.size.width, self.timeLable.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:@"立即更新"];
}

//- (void)deleteButtonClick {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
//        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
//    }
//}

@end
