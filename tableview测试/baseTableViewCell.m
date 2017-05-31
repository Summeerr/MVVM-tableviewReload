//
//  baseTableViewCell.m
//  tableview测试
//
//  Created by job on 2016/10/14.
//  Copyright © 2016年 com.job36. All rights reserved.
//

#import "baseTableViewCell.h"

@implementation baseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self.backgroundColor = [UIColor lightGrayColor];
        
    }
    return self;
}



@end
