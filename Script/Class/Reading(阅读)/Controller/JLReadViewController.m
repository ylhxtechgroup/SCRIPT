//
//  JLReadController.m
//  XieXiaoShuo
//
//  Created by apple on 2017/2/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLReadViewController.h"
#import "JLHotController.h"
#import "JLRomanceController.h"
#import "JLSchoolController.h"
#import "JLFantasyController.h"

@interface JLReadViewController ()

@property (nonatomic ,weak)UICollectionView  *collectV;
@property (nonatomic ,weak)UIScrollView *topView;
@property (nonatomic ,weak)UIButton  *seleBtn;
@property (nonatomic ,strong)NSMutableArray *btnS;

@end

@implementation JLReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"阅读";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加子控制器
    [self setupAllChildViewController];
    
    
    
//    /**
//     *  创建collectionView
//     */
//    [self setUpCollectionView];
//    /**
//     *  创建头部滚动视图
//     */
//    [self setupTopTitleView];
//    [self setupAllTitleButton];
 
    self.isfullScreen = YES;
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor, BOOL *isUnderLineEqualTitleWidth) {
        *isUnderLineDelayScroll = YES;
        *isUnderLineEqualTitleWidth = YES;
    }];
    
  
    
}



/**- (void) setUpCollectionView{
    //创建流水布局
    UICollectionViewFlowLayout *flLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flLayout.itemSize = CGSizeMake(JLScreenW, JLScreenH);
    flLayout.minimumLineSpacing = 0;
    //滚动方向
    flLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView * collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flLayout];
    self.collectV = collection;
    
    collection.dataSource = self;
    collection.delegate = self;
    
    //开启分页效果和关闭弹簧效果
    collection.pagingEnabled = YES;
    collection.bounces = NO;
    
    //注册
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collection];
    
    //取消 自动添加的额外滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;
}*/

- (void)setupAllChildViewController
{
    // 热门
    JLHotController *hotVc = [[JLHotController alloc] init];
    hotVc.title = @"热门";
    [self addChildViewController:hotVc];
    
    // 言情
    JLRomanceController *romanceVc = [[JLRomanceController alloc] init];
    romanceVc.title = @"言情";
    [self addChildViewController:romanceVc];
    
    // 校园
    JLSchoolController *schoolVc = [[JLSchoolController alloc] init];
    schoolVc.title = @"校园";
    [self addChildViewController:schoolVc];
    
    // 玄幻
    JLFantasyController *fantasyVc = [[JLFantasyController alloc] init];
    fantasyVc.title = @"玄幻";
    [self addChildViewController:fantasyVc];
    
    
}
/**
 *  创建头部滚动视图
 
- (void) setupTopTitleView{
    UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, JLScreenW, 35)];
    sc.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    [self.view addSubview:sc];
    sc.contentSize = CGSizeMake(JLScreenW *2, 0);
    sc.pagingEnabled = YES;
    sc.scrollEnabled = YES;
    sc.userInteractionEnabled = YES;
    
    self.topView = sc;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


 //  创建 所有的topBtn
 
- (void) setupAllTitleButton{
    NSInteger  count = self.childViewControllers.count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = JLScreenW/ count;
    CGFloat btnH = 35;
    for (int i = 0; i < count ; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = i;
        btnX = i *btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        UITableViewController *vc = self.childViewControllers[i];
        [btn setTitle: vc.title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:btn];
        
        [self.btnS addObject:btn];
        
        if (i == 0) {
            [self btnClick:btn];
        }
    }
    
    
}
- (void)btnClick:(UIButton *)btn{
    //1.按钮点击
    [self selectedBtn:btn];
    //2.点击按钮 切换子控制器
    CGFloat offSetX = btn.tag *JLScreenW;
    self.collectV.contentOffset = CGPointMake(offSetX, 0);
    
}

- (void)selectedBtn:(UIButton *)btn{
    self.seleBtn.selected = NO;
    btn.selected = YES;
    self.seleBtn = btn;
    
}

#pragma  mark  CollectionView  Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.btnS.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    //删除cell的子视图 节省内存。
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UITableViewController *tableVC = self.childViewControllers[indexPath.row];
    
    tableVC.tableView.contentInset = UIEdgeInsetsMake(64+35, 0, 49, 0);
    tableVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    
    [cell.contentView addSubview:tableVC.view];
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / JLScreenW;
    [self selectedBtn:self.btnS[page]];
    
}

*/

@end
