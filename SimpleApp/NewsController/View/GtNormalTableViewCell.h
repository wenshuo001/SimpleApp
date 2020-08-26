//
//  GtNormalTableViewCell.h
//  SimpleApp
//
//  Created by Wenshuo on 2020/4/7.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;
/**
 delegate  和 java 接口回调差不多
 声明delegate , 点击删除按钮
 */
@protocol GTNormalTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

@interface GtNormalTableViewCell : UITableViewCell

-(void) layouttableViewCell;

@property (nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

-(void)layoutTableViewCellWithItem:(GTListItem *)item;
@end

NS_ASSUME_NONNULL_END


