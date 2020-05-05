//
//  CollectionViewController.m
//  SimpleApp
//
//  Created by Wenshuo on 2020/4/5.
//  Copyright © 2020年 Wenshuo. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation CollectionViewController

// UICollectionViewScrollDirectionVertical  垂直方向
// UICollectionViewScrollDirectionHorizontal 水平方向

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc ]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing =10 ; // 垂直间隔
    layout.minimumInteritemSpacing =10; // 用来计算一行可以布局多少个 item
    layout.itemSize = CGSizeMake((self.view.frame.size.width-10)/2 , 200);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[UICollectionViewCell class]  forCellWithReuseIdentifier:@"cellID" ];
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
    return 10;
}

// 设置流式具体布局
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

// 设置 item 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item %3 == 0){
        return CGSizeMake(self.view.frame.size.width, 100);
    }else{
        return CGSizeMake((self.view.frame.size.width-10)/2 , 200);
    }
}

@end
