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
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.clipsToBounds=YES;
    self.layer.cornerRadius=self.frame.size.height/2;
}


//-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
//    UICollectionViewLayoutAttributes *attr=[layoutAttributes copy];
//    
//    CGRect newFrame = attr.frame;
//    self.frame = newFrame;
//    
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
//    
//    CGFloat desiredWidth=[self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].width;
//    newFrame.size.width= desiredWidth;
//    attr.frame = newFrame;
//    return attr;
//}



@end
