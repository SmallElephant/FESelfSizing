//
//  BookCollectionViewController.m
//  FEAutoCollectionView
//
//  Created by FlyElephant on 16/5/3.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "BookCollectionViewController.h"
#import "BookCollectionViewCell.h"

static NSString *const CollectionViewIdentifier = @"BookCollectionViewCell";

@interface BookCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSMutableArray *data;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation BookCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
      NSLog(@"numberOfItemsInSection执行");
    return [self.data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BookCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewIdentifier forIndexPath:indexPath];
    cell.contentLabel.text = self.data[indexPath.row];
//    cell.backgroundColor=[UIColor redColor];
    NSLog(@"cellForItemAtIndexPath执行");
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    cell.layer.clipsToBound=YES;
    NSLog(@"WillDisplay:---indexpath:%@---cellSize：%@",indexPath,NSStringFromCGSize(cell.frame.size));
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    BookCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewIdentifier forIndexPath:indexPath];
//    NSLog(@"size:%@",NSStringFromCGSize(cell.frame.size));
//    return cell.frame.size;
//}


#pragma mark - setup

- (void)setup {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = CGSizeMake(100, 100);
//    layout.itemSize=CGSizeMake(100, 100);
    [self.collectionView registerClass:[BookCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewIdentifier];
    self.collectionView.backgroundColor      = [UIColor redColor];
    self.collectionView.collectionViewLayout = layout;
    self.data                                = [NSMutableArray array];
    
    [self.data addObject:@"北京"];
    [self.data addObject:@"工作时间"];
    [self.data addObject:@"工作年限"];
    [self.data addObject:@"编程"];
    [self.data addObject:@"加班"];
    [self.data addObject:@"Beijing Tian An Men"];
    [self.data addObject:@"UICollectioView自适应"];
}

@end
