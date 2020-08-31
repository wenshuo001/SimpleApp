//
//  GTVideoCoverView.h
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/27.
//  Copyright © 2020 Wenshuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell
/**
 根据数据布局，封面图&播放 url
 */
-(void)layoutWithVideoCoverUrl: (NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;
@end

NS_ASSUME_NONNULL_END
