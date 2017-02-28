//
//  JLTabBarController.m
//  XieXiaoShuo
//
//  Created by apple on 2017/2/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JLTabBarController.h"

#import "JLNavigationController.h"

#import "JLReadViewController.h"
#import "JLWhriteController.h"
#import "JLBookShelfController.h"
#import "JLCreationController.h"
#import "JLMeController.h"


@interface JLTabBarController ()<UITabBarControllerDelegate>

@end

@implementation JLTabBarController

+(void)load{

    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName]= [UIColor blackColor];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllChildViewControllers];
    
    [self setupAllTabBarButton];
}

-(void)setupAllChildViewControllers{

    // 阅读
    JLReadViewController *readVC = [[JLReadViewController alloc] init];
    JLNavigationController *nav = [[JLNavigationController alloc] initWithRootViewController:readVC];
    [self addChildViewController:nav];
    
    // 写手
    JLWhriteController *whriteVc = [[JLWhriteController alloc] init];
    JLNavigationController *whriteNav = [[JLNavigationController alloc] initWithRootViewController:whriteVc];
    [self addChildViewController:whriteNav];
    
    // 书架
    JLBookShelfController *bookVc = [[JLBookShelfController alloc] init];
    
    JLNavigationController *nav1 = [[JLNavigationController alloc] initWithRootViewController:bookVc];
    [self addChildViewController:nav1];

    // 创作
    JLCreationController *creatVC = [[JLCreationController alloc] init];
    JLNavigationController *nav2 = [[JLNavigationController alloc] initWithRootViewController:creatVC];
    [self addChildViewController:nav2];
    
    // 我
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"JLMeController" bundle:nil];
    JLMeController *user = [storyboard instantiateInitialViewController];
    UINavigationController *userNav = [[UINavigationController alloc]initWithRootViewController:user];
    [self addChildViewController:userNav];
}

-(void)setupAllTabBarButton{
    
    // 0
    UIViewController *vc = self.childViewControllers[0];
//    vc.tabBarItem.title = @"阅读";
//    vc.tabBarItem.image = [UIImage imageNamed:@"read"];
//    vc.tabBarItem.selectedImage = [UIImage imageWithOriginalRender:@"read-c"];
    [self addChildVc:vc title:@"阅读" image:@"read" selectedImage:@"read-c"];

    // 1
    UIViewController *vc1 = self.childViewControllers[1];
//    vc1.tabBarItem.title = @"写手";
//    vc1.tabBarItem.image = [UIImage imageNamed:@"bookShelf"];
//    vc1.tabBarItem.selectedImage = [UIImage imageWithOriginalRender:@"bookShelf-c"];
    [self addChildVc:vc1 title:@"写手" image:@"bookShelf" selectedImage:@"bookShelf-c"];

    // 2
    UIViewController *vc2 = self.childViewControllers[2];
//    vc2.tabBarItem.title = @"书架";
//    vc2.tabBarItem.image = [UIImage imageNamed:@"bookShelf"];
//    vc2.tabBarItem.selectedImage = [UIImage imageWithOriginalRender:@"bookShelf-c"];
    
    [self addChildVc:vc2 title:@"书架" image:@"bookShelf" selectedImage:@"bookShelf-c"];
    // 3
    UIViewController *vc3 = self.childViewControllers[3];
//    vc3.tabBarItem.title = @"创作";
//    vc3.tabBarItem.image = [UIImage imageNamed:@"Creat"];
//    vc3.tabBarItem.selectedImage = [UIImage imageWithOriginalRender:@"Creat-c"];
    [self addChildVc:vc3 title:@"创作" image:@"Creat" selectedImage:@"Creat-c"];
    // 4
    UIViewController *vc4 = self.childViewControllers[4];
//    vc4.tabBarItem.title = @"我";
//    vc4.tabBarItem.image = [UIImage imageNamed:@"Me"];
//    vc4.tabBarItem.selectedImage = [UIImage imageWithOriginalRender:@"Me-c"];
    [self addChildVc:vc4 title:@"我" image:@"Me" selectedImage:@"Me-c"];
}



- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor purpleColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
}
@end
