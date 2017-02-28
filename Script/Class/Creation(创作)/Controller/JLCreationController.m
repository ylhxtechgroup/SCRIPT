//
//  JLCreationController.m
//  Script
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLCreationController.h"
#import "XYContractTableViewCell.h"

@interface JLCreationController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *headerView;
}
@property (nonatomic ,strong) UITableView    *table;
@property (nonatomic ,strong) NSMutableArray *textMutArr;

@end

@implementation JLCreationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创作";
    [self createTable];
    //添加tableView的头
    [self createTabelViewHeader];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)createTable
{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    self.table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.table];
}
//添加tableView的头
- (void)createTabelViewHeader
{
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    headerView.backgroundColor = [UIColor whiteColor];
    UIButton *contractBtn = [[UIButton alloc]init];
    contractBtn.frame = CGRectMake(headerView.frame.size.width/2-50,headerView.frame.size.height / 2-50, 100, 100);
    [contractBtn setBackgroundImage:[UIImage imageNamed:@"qianyue.png"] forState:UIControlStateNormal];
    [contractBtn addTarget:self action:@selector(touchcontractBtn:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:contractBtn];
    self.table.tableHeaderView = headerView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    //    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier1 = @"cell1";
    XYContractTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier1];
    if(cell == nil) {
        cell = [[XYContractTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier1] ;
    }
    cell.title.text = self.textMutArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
//
- (void)touchcontractBtn:(UIButton *)sender{
    
    
}
- (NSMutableArray *)textMutArr{
    if (!_textMutArr) {
        _textMutArr = [NSMutableArray array];
        _textMutArr = @[@"我的剧本",@"审核剧本",@"出售剧本"].mutableCopy;
    }
    return  _textMutArr;
}

@end
