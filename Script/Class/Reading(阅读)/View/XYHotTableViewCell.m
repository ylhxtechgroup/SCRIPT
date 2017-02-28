//
//  XYHotTableViewCell.m
//  XieXiaoshuo
//
//  Created by nian on 2017/2/15.
//  Copyright © 2017年 seventeen. All rights reserved.
//

#import "XYHotTableViewCell.h"

@implementation XYHotTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.nameLab = [[UILabel alloc]init];
        self.nameLab.font = [UIFont systemFontOfSize:17 * Rate];
//        self.nameLab.textColor = colorFromRGB(0x000000);
        self.nameLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.nameLab];
        
        self.authorLab = [[UILabel alloc]init];
        self.authorLab.font = [UIFont systemFontOfSize:13 * Rate];
//        self.authorLab.textColor = colorFromRGB(0x000000);
        self.authorLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.authorLab];
        
        self.detailsLab = [[UILabel alloc]init];
        self.detailsLab.font = [UIFont systemFontOfSize:14 * Rate];
//        self.detailsTextView.textColor = colorFromRGB(0x000000);
        self.detailsLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.detailsLab];
        self.exceptionalBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [self.exceptionalBtn setBackgroundImage:[UIImage imageNamed:@"234.png"] forState:UIControlStateNormal];
        
        [self addSubview:self.exceptionalBtn];

        self.fenleiLab = [[UILabel alloc]init];
        self.fenleiLab.font = [UIFont systemFontOfSize:12 * Rate];
//        self.fenleiLab.textColor = colorFromRGB(0xfc2b5f);
        self.fenleiLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.fenleiLab];
        
        self.numberLab = [[UILabel alloc]init];
        self.numberLab.font = [UIFont systemFontOfSize:12 * Rate];
//        self.numberLab.textColor = colorFromRGB(0xfd6dec);
        self.numberLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.numberLab];
        self.line = [[UILabel alloc]init];
//        self.line.backgroundColor = colorFromRGB(0xcccccc);
        [self addSubview:self.line];
        
    }
    
    return self;
    
}


- (void)layoutSubviews{
    
    CGFloat gap = 8 * Rate;
    
    self.nameLab.frame = CGRectMake(gap, gap, 180 * Rate, 21 * Rate);
    
    self.authorLab.frame = CGRectMake(SCREEN_WIDTH - gap - 90 * Rate, gap + 5 * Rate, 90 * Rate, 16 * Rate);
    
    self.detailsLab.frame = CGRectMake(gap, CGRectGetMaxY(self.nameLab.frame) + gap, 220*Rate, 88 * Rate);
   
    self.exceptionalBtn.frame = CGRectMake(SCREEN_WIDTH - gap - 50 * Rate, CGRectGetMaxY(self.nameLab.frame) + gap*2, 50*Rate, 50 * Rate);

    self.fenleiLab.frame = CGRectMake(gap, CGRectGetMaxY(self.detailsLab.frame) + gap/2, 25 * Rate, 21 * Rate);
    
    self.numberLab.frame = CGRectMake(SCREEN_WIDTH - gap - 150 * Rate, self.fenleiLab.frame.origin.y, 150 * Rate, 21 * Rate);
    
    self.line.frame = CGRectMake(0, self.frame.size.height - 0.6 * Rate, SCREEN_WIDTH, 0.6 * Rate);
    
}

- (void)setDetailsModel{
    
    self.nameLab.text = @"《三生三世十里桃花》";
    self.detailsLab.numberOfLines = 3;
    self.detailsLab.text = @"简介：远古众神凋零，现今只存了龙族、凤族、九尾白狐一族还留了些后人。狐帝白止膝下得了四个儿子一个女儿。这唯一的一个女儿长得颇好，却是个炮灰命。活到十四万岁的高龄，笼统不过遇得五朵桃花。一朵碍于异族不能通婚，那思慕尚处于萌芽期，便被该桃花的爹娘终结了。一朵误以为她是个男儿身，纠结于这段断袖情，待出现个跟她长得相似的女子，立刻便跟着人跑了。一朵是他爹娘亲自做主给她定的亲，待到他们家走一趟，却看上了她的婢女，两人私奔了。一朵在心底里暗恋她暗恋了万儿八千年不敢表白，待鼓起勇气来表白时，她前未婚夫的爹娘为了补偿她，又与她重新结了一门亲。前头四朵桃花有三朵都是烂桃花，唯一算得上好的一朵，却又是个才打骨苞儿的。这五朵桃花中的最后一朵，是她命中注定的夫君，九重天上的太子夜华。 ";
    self.authorLab.text = @"作者：心月";
    self.fenleiLab.text = @"分类";
    self.numberLab.text = @"点击量：10000";
}





@end
