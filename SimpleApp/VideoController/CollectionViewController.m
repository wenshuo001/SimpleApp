//
//  CollectionViewController.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/4/5.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "CollectionViewController.h"
#import "GTVideoCoverView.h"
 #import "GTVideoToolbar.h"
@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation CollectionViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"订单2-1"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"订单1"];
    }
    return self;
}

// UICollectionViewScrollDirectionVertical  垂直方向
// UICollectionViewScrollDirectionHorizontal 水平方向

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc ]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 10 ;// 水平间隔
    layout.minimumInteritemSpacing = 10;// 垂直间隔
    layout.itemSize = CGSizeMake(self.view.frame.size.width , self.view.frame.size.width / 16 * 9 + GTVideoToolbarHeight); // 用来计算一行可以布局多少个 item
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    //注册Item class
    [collectionView registerClass:[GTVideoCoverView class]  forCellWithReuseIdentifier:@"cellID" ];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// 设置流式具体布局
//__kindof 修饰的返回类型 - 则规定只能返回当前类型和它的子类
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
     // 判断类型是否是注册的cell 类型
    if ([cell isKindOfClass:[GTVideoCoverView class]]) {
        //方便讲解事例数据
        [(GTVideoCoverView *)cell layoutWithVideoCoverUrl:@"videoCover" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }

    return cell;
}

#pragma mark - 自定义ItemSize
// 自定义 item 大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.item %3 == 0){
//        return CGSizeMake(self.view.frame.size.width, 100);
//    }else{
//        return CGSizeMake((self.view.frame.size.width-10)/2 , 200);
//    }
//}

@end
