//
//  GTVideoPlayer.m
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/27.
//  Copyright © 2020 Wenshuo. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "GTVideoPlayer.h"

@interface GTVideoPlayer()

@property (nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property (nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property (nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@end

@implementation GTVideoPlayer
    

+(GTVideoPlayer *)Player{
    //当static关键字修饰局部变量时，只会初始化一次
    static GTVideoPlayer *player;
    // dispatch_once创建单例
    // dispatch_once不仅意味着代码仅会被运行一次，而且还是线程安全的
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}

-(void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView{
    //首先暂停播放
    [self _stopPlay];
    
    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    //监听视频资源状态
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    //监听视频缓冲状态
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    //需要在状态变化获取时间
    CMTime duration = _videoItem.duration;
    //在变量前加__unused前缀，就可以免除警告。其原理是告诉编译器，如果变量未使用就不参与编译。
    __unused CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    //创建播放器
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    
    //监听播放器播放进度
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度: %@",@(CMTimeGetSeconds(time)));
    }];
    
    //展示playerLayer
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_playerLayer];
    
    //接收播放完成NOtification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name: AVPlayerItemDidPlayToEndTimeNotification object:nil];
}


-(void)_stopPlay{
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    
    //销毁播放器
    [_playerLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;
}

-(void)_handlePlayEnd{
    //播放完成后循环播放
    [_avPlayer seekToTime:CMTimeMake(0,1)];
    [_avPlayer play];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        if(((NSNumber *)[change objectForKey: NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
            //在合适的时机开始播放
            [_avPlayer play];
        }else{
            //监控错误
        }
    } else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        //缓冲进度监听
        NSLog(@"缓存: %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
