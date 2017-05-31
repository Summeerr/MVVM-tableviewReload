//
//  ViewController.m
//  tableview测试
//
//  Created by job on 2016/10/14.
//  Copyright © 2016年 com.job36. All rights reserved.
//

#import "ViewController.h"
#import "HXOneViewController.h"

#import "HXTableViewDelegate.h"




@interface ViewController ()
@property (nonatomic,strong)HXTableViewDelegate *tabDelegate;

@property (nonatomic, weak) UITableView *tableView;

/**
 *  最近的数据数组
 */
@property (nonatomic, strong) NSMutableArray *recentArrM;
/**
 *  最新的数据数组
 */
@property (nonatomic, strong) NSMutableArray *lastArrM;


@end

@implementation ViewController
-(NSMutableArray *)recentArrM{
    if (!_recentArrM) {
        _recentArrM = [NSMutableArray array];
    }
    return _recentArrM;
}

-(NSMutableArray *)lastArrM{
    if (!_lastArrM) {
        _lastArrM = [NSMutableArray array];
    }
    return _lastArrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabDelegate = [HXTableViewDelegate new];
    __weak typeof(self)weakSelf = self;
    self.tabDelegate.myBlock = ^(UITableViewCell *cell, NSInteger index) {
        
        [weakSelf presentViewController:[HXOneViewController new] animated:YES completion:nil];
        
        
    };
    
    self.tabDelegate.sectionBlock = ^(UIView *view, NSInteger index) {
        if (index == 1) {
            UIButton *btn = (UIButton *)view;
            [btn addTarget:weakSelf action:@selector(addNew) forControlEvents:UIControlEventTouchUpInside];
        }
    };
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStyleGrouped];
    tableView.dataSource = self.tabDelegate;
    tableView.delegate = self.tabDelegate;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIButton *morebtn = [[UIButton alloc]initWithFrame:CGRectMake(250, 500, 80, 80)];
    [morebtn addTarget:self action:@selector(addMore) forControlEvents:UIControlEventTouchUpInside];
    [morebtn setTitle:@"加载更多数据" forState:UIControlStateNormal];
    [morebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    morebtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:morebtn];
    morebtn.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 80, 80)];
    [btn setTitle:@"加载最新数据" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(addNew) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor yellowColor];

    [self addNew];
}

-(void)addNew{
    [self addMore];
    [self.lastArrM removeAllObjects];
    [self.recentArrM removeAllObjects];
    [self.lastArrM addObjectsFromArray:@[
                                         @{
                                             @"title":@"最新的数据",
                                             @"subtitle":@"aaa",
                                             },
                                         @{
                                             @"title":@"最新的数据222",
                                             @"subtitle":@"bbb",
                                             },
                                         @{
                                             @"title":@"最新的数据333",
                                             @"subtitle":@"333",
                                             }
                                         ]];
  
    [self.recentArrM addObjectsFromArray:@[
                                           @{
                                               @"title":@"111",
                                               @"subtitle":@"aaa",
                                               },
                                           @{
                                               @"title":@"222",
                                               @"subtitle":@"bbb",
                                               },
                                           @{
                                               @"title":@"333",
                                               @"subtitle":@"333",
                                               }
                                           ]];

    self.tabDelegate.lastArr = self.lastArrM;
    self.tabDelegate.arr = self.recentArrM;
    [self.tableView reloadData];

}

-(void)addMore{
    
    [self.recentArrM addObjectsFromArray:@[
                                           
                                           @{
                                               @"title":@"加载111",
                                               @"subtitle":@"aaa",
                                               },
                                           @{
                                               @"title":@"加载222",
                                               @"subtitle":@"bbb",
                                               },
                                           @{
                                               @"title":@"加载333",
                                               @"subtitle":@"333",
                                               }
                                           ]];

    self.tabDelegate.arr = self.recentArrM;
    [self.tableView reloadData];

}

@end
