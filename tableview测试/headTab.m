//
//  headTab.m
//  tableview测试
//
//  Created by job on 2016/10/19.
//  Copyright © 2016年 com.job36. All rights reserved.
//

#import "headTab.h"
@interface headTab()
@property (nonatomic,strong)UILabel *tiL;

@end
@implementation headTab

-(UILabel *)tiL{
    if (!_tiL) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 20)];
        label.text = @"12346iadhsd6";
        label.textAlignment = NSTextAlignmentCenter;
        _tiL = label;
    }
    return _tiL;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tiL];
        
    }
    return self;
}

@end
