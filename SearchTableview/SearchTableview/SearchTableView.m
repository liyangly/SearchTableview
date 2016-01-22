//
//  SearchTableView.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/22.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "SearchTableView.h"

@implementation SearchTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataarr.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    if (cell == nil) {
        cell = [UITableViewCell new];
    }
    UILabel *typelab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    [cell.contentView addSubview:typelab];
    typelab.text = @"类型";
    UILabel *titlab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-20, 30)];
    [cell.contentView addSubview:titlab];
    titlab.text = @"名称";
    titlab.textAlignment = NSTextAlignmentRight;
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 1)];
    [cell.contentView addSubview:line];
    line.backgroundColor = [UIColor lightGrayColor];
    
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    if (cell == nil) {
        cell = [UITableViewCell new];
    }
    UILabel *typelab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    [cell.contentView addSubview:typelab];
    typelab.text = [NSString stringWithFormat:@"%@",[_dataarr[indexPath.row] objectForKey:@"type"]];
    UILabel *titlab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-20, 30)];
    [cell.contentView addSubview:titlab];
    titlab.text = [NSString stringWithFormat:@"%@",[_dataarr[indexPath.row] objectForKey:@"title"]];
    titlab.textAlignment = NSTextAlignmentRight;
    
    return cell;
}


@end
