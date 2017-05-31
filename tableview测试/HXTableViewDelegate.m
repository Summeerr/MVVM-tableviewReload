//
//  HXTableViewDelegate.m
//  tableview测试
//
//  Created by job on 2017/5/25.
//  Copyright © 2017年 com.job36. All rights reserved.
//

#import "HXTableViewDelegate.h"
#import "headTab.h"

#import "baseTableViewCell.h"
@interface HXTableViewDelegate ()

@end
@implementation HXTableViewDelegate

-(void)setArr:(NSArray *)arr{
    _arr = arr;
}
-(void)setLastArr:(NSArray *)lastArr{
    _lastArr = lastArr;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.lastArr.count;
    }else{
        return self.arr.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    baseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[baseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = self.arr[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    cell.detailTextLabel.text = dic[@"subtitle"];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        headTab *head = [[headTab alloc]initWithFrame:CGRectMake(0, 0, 375, 44)];
        head.backgroundColor = [UIColor cyanColor];
        return head;
    }else{
        UIButton *view = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 375, 30)];
        [view setTitle:@"上次浏览到这里" forState:UIControlStateNormal];
        view.backgroundColor = [UIColor cyanColor];
        if (self.sectionBlock) {
            self.sectionBlock(view, section);
        }
        return view;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.myBlock) {
        self.myBlock([tableView cellForRowAtIndexPath:indexPath], indexPath.row);
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}




@end
