//
//  XYContractTableViewCell.m
//  XieXiaoshuo
//
//  Created by 赵心月 on 2017/2/27.
//  Copyright © 2017年 seventeen. All rights reserved.
//

#import "XYContractTableViewCell.h"

@implementation XYContractTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
    }
    return self;
}

- (void)createView
{
      self.title = [[UILabel alloc] init];
    [self.contentView addSubview:self.title];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.title.frame = CGRectMake(10, 8 + 10, 100, 20);
}


@end
