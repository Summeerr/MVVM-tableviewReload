//
//  HXTableViewDelegate.h
//  tableview测试
//
//  Created by job on 2017/5/25.
//  Copyright © 2017年 com.job36. All rights reserved.
//


#import <UIKit/UIKit.h>
typedef void (^cellClick)(UITableViewCell *cell, NSInteger index);
typedef void (^sectionClick)(UIView *view, NSInteger index);
@interface HXTableViewDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *lastArr;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,copy) cellClick myBlock;
@property (nonatomic, copy) sectionClick sectionBlock;
@end
