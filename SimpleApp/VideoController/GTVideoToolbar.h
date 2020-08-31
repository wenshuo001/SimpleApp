//
//  GTVideoToolbar.h
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/27.
//  Copyright © 2020 Wenshuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTScreen.h"

NS_ASSUME_NONNULL_BEGIN
#define GTVideoToolbarHeight UI(60)
/**
视频ViewController Item下的Toolbar
*/
@interface GTVideoToolbar : UIView
/**
 根据数据布局Toolbar
 */
- (void)layoutWithModel:(id)model;
@end

NS_ASSUME_NONNULL_END
