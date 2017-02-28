//
//  JLFantasyController.m
//  XieXiaoShuo
//
//  Created by apple on 2017/2/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLFantasyController.h"
static NSString * const ID = @"fantasy";
@interface JLFantasyController ()

@end

@implementation JLFantasyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
  cell.textLabel.text = [NSString stringWithFormat:@"玄幻玄幻玄幻玄幻玄幻玄幻%ld",indexPath.row];
    
    return cell;
}



@end
