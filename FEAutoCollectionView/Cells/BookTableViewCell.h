//
//  BookTableViewCell.h
//  FEAutoCollectionView
//
//  Created by FlyElephant on 16/5/3.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"

@interface BookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverImagView;

@property (weak, nonatomic) IBOutlet UILabel *bookName;

@property (weak, nonatomic) IBOutlet UILabel *bookContent;

-(void)setupModel:(BookModel *)model;

@end
