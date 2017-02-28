//
//  XYBookShelfTableViewCell.m
//  XieXiaoshuo
//
//  Created by 赵心月 on 2017/2/20.
//  Copyright © 2017年 seventeen. All rights reserved.
//

#import "XYBookShelfTableViewCell.h"

@implementation XYBookShelfTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.imageV = [[UIImageView alloc] init];
    self.imageV.layer.cornerRadius = 20;
    self.imageV.clipsToBounds = YES;
    [self.contentView addSubview:self.imageV];
    self.title = [[UILabel alloc] init];
    [self.contentView addSubview:self.title];
    }
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(8, 6, 40, 40);
    self.title.frame = CGRectMake(66, 8 + 10, 100, 20);
}



@end
