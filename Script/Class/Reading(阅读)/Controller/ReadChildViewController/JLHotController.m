//
//  JLHotController.m
//  XieXiaoShuo
//
//  Created by apple on 2017/2/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLHotController.h"
#import "XYHotTableViewCell.h"
@interface JLHotController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation JLHotController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layouTableView];
}
- (void)layouTableView{
    
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 35 - 49) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.rowHeight = 154 * Rate;
    self.mainTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:self.mainTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellID = @"hotCell";
    
    XYHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[XYHotTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    [cell setDetailsModel];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



 
 @end
