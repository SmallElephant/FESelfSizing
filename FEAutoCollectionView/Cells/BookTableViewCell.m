//
//  BookTableViewCell.m
//  FEAutoCollectionView
//
//  Created by FlyElephant on 16/5/3.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "BookTableViewCell.h"

@interface BookTableViewCell()



@end

@implementation BookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   self.coverImagView.clipsToBounds=YES;
    self.layer.masksToBounds=YES;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"BookTableCell" owner:self options:nil];
        self=[views firstObject];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setupModel:(BookModel *)model{
    self.coverImagView.image=[UIImage imageNamed:model.imgName];
    self.bookName.text=model.bookName;
    self.bookContent.text=model.bookDescription;
}


@end
