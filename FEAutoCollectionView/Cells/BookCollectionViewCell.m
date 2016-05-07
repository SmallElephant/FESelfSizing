//
//  BookCollectionViewCell.m
//  FEAutoCollectionView
//
//  Created by FlyElephant on 16/5/3.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "BookCollectionViewCell.h"

@implementation BookCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[[NSBundle mainBundle] loadNibNamed:@"BookCollectionCell" owner:self options:nil] firstObject];
        self.backgroundColor=[UIColor darkGrayColor];
        self.clipsToBounds=YES;
//        self.layer.cornerRadius=12;
    }
    return self;
}

//-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
//
//}

-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"LayOutSubView:%@",NSStringFromCGRect(self.frame));
    self.clipsToBounds=YES;
    self.layer.cornerRadius=self.frame.size.width/8;
}

@end
