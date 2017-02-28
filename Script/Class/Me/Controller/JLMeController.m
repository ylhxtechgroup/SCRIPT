//
//  JLMeController.m
//  XieXiaoShuo
//
//  Created by apple on 2017/2/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLMeController.h"

@interface JLMeController ()
@property (weak, nonatomic) IBOutlet UIImageView *TitleView;

@end

@implementation JLMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];

     self.title = @"我的";
}



@end
