//
//  JLBookShelfController.m
//  Script
//
//  Created by apple on 2017/2/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLBookShelfController.h"
#import "XYBookShelfTableViewCell.h"

@interface JLBookShelfController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *headerView;
}
@property (nonatomic ,strong) UITableView    *table;
@property (nonatomic ,strong) NSMutableArray *jubenMutArr;
@property (nonatomic ,strong) UIScrollView   *jubenScrollView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *textArray;
@property (nonatomic, strong) NSMutableArray *sectionTextArray;
@property (nonatomic, strong) NSMutableArray *sectionImageArray;


@end

@implementation JLBookShelfController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"书架";
    [self createTable];
//添加tableView的头
    [self createTabelViewHeader];
    }
- (void)createTable
{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    self.table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.table];
    
}
//添加tableView的头
- (void)createTabelViewHeader
{
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
    self.table.tableHeaderView = headerView;
    
    UIScrollView *jubenView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 180)];
    
    //    jubenView.contentSize = CGSizeMake(self.jubenMutArr.count * 75 + 15, 85);
    jubenView.contentSize = CGSizeMake(10 * 100, 105);
    jubenView.backgroundColor  = [UIColor whiteColor];
    jubenView.directionalLockEnabled = NO;
    jubenView.showsHorizontalScrollIndicator = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    jubenView.showsVerticalScrollIndicator = NO;
    [headerView addSubview:jubenView];
    self.jubenScrollView = jubenView;
    // 添加封面和剧本名
    //    for (int i = 0 ; i < self.jubenMutArr.count; i++){
    for (int i = 0 ; i < 10; i++){
        //      self.friend= self.jubenMutArr[i];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(i*100,3, 100, 140)];
        imageview.userInteractionEnabled = YES;
        //        if ([self.friend.avatar length] > 4) {
        //            if ([[self.friend.avatar substringToIndex:4] isEqualToString:@"http"]) {
        //                [imageview sd_setImageWithURL:ImageURL(self.friend.avatar) placeholderImage:[UIImage imageNamed:@"avatar"]];
        //            } else{
        //                [imageview sd_setImageWithURL:Image_80(self.friend.avatar) placeholderImage:[UIImage imageNamed:@"avatar"]];
        //            }
        //        } else {
        imageview.backgroundColor =[UIColor yellowColor];
        imageview.image = [UIImage imageNamed:@"123"];
        //        }
        [jubenView addSubview:imageview];
        UIButton *jumingButton = [[UIButton alloc]init];
        jumingButton.frame = CGRectMake(i*100,3, 100, 140);
        jumingButton.tag = i+700;
        [jumingButton addTarget:self action:@selector(touchavatar:) forControlEvents:UIControlEventTouchUpInside];
        [jubenView addSubview:jumingButton];
        UILabel *jumingLabel = [[UILabel alloc]init];
        jumingLabel.text = @"甄嬛传";
        jumingLabel.textColor = [UIColor purpleColor];
        jumingLabel.font = [UIFont systemFontOfSize:13.0];
        jumingLabel.textAlignment = NSTextAlignmentCenter;
        jumingLabel.frame = CGRectMake(jumingButton.frame.origin.x, 152, 100, 22);
        jumingLabel.userInteractionEnabled = YES;
        [jubenView addSubview:jumingLabel];
    }
    [headerView addSubview:jubenView];
    
}
- (void)touchavatar:(UIButton *)sender{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
    //    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier1 = @"cell1";
    XYBookShelfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier1];
    if(cell == nil) {
        cell = [[XYBookShelfTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier1] ;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.imageV.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
        cell.title.text = self.textArray[indexPath.row];
        
    }else{
        cell.imageV.image = [UIImage imageNamed:self.sectionImageArray[indexPath.row]];
        cell.title.text = self.sectionTextArray[indexPath.row];
    }
    return cell;
}

- (NSMutableArray *)jubenMutArr{
    if (!_jubenMutArr) {
        _jubenMutArr = [[NSMutableArray alloc]init];
    }
    return  _jubenMutArr;
}
- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
        _imageArray = @[@"123",@"123"].mutableCopy;
    }
    return _imageArray;
}
- (NSMutableArray *)sectionImageArray
{
    if (!_sectionImageArray) {
        _sectionImageArray = [NSMutableArray array];
        _sectionImageArray = @[@"123",@"123"].mutableCopy;
    }
    return _sectionImageArray;
}


- (NSMutableArray *)textArray
{
    if (!_textArray) {
        _textArray = [NSMutableArray array];
        _textArray = @[@"全部收藏",@"最近更新"].mutableCopy;
    }
    return _textArray;
}
- (NSMutableArray *)sectionTextArray
{
    if (!_sectionTextArray) {
        _sectionTextArray = [NSMutableArray array];
        _sectionTextArray = @[@"最近阅读",@"已离线作品"].mutableCopy;
    }
    return _sectionTextArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
