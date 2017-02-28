//
//  XYHotTableViewCell.h
//  XieXiaoshuo
//
//  Created by nian on 2017/2/15.
//  Copyright © 2017年 seventeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYHotTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLab;

@property (nonatomic, strong) UILabel *authorLab;

@property (nonatomic, strong) UILabel *detailsLab;

@property (nonatomic, strong) UIButton *exceptionalBtn;

@property (nonatomic, strong) UILabel *fenleiLab;

@property (nonatomic, strong) UILabel *numberLab;

@property (nonatomic, strong) UILabel *line;

- (void)setDetailsModel;


@end
