//
//  JLSchoolController.m
//  XieXiaoShuo
//
//  Created by apple on 2017/2/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLSchoolController.h"

static NSString * const ID = @"school";
@interface JLSchoolController ()

@end

@implementation JLSchoolController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return 40;
}
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
         cell.textLabel.text = [NSString stringWithFormat:@"校园校园%ld",indexPath.row];
 
    return cell;
}

 @end
