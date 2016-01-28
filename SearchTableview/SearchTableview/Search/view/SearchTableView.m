//
//  SearchTableView.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/22.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "SearchTableView.h"
#import "SearchCell.h"
static NSString * const cellID = @"ID";
@implementation SearchTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        [self registerNib:[UINib nibWithNibName:@"SearchCell" bundle:nil] forCellReuseIdentifier:cellID];
        self.rowHeight = 88.0;
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
    typelab.text = @"明细";
    UILabel *titlab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-20, 30)];
    [cell.contentView addSubview:titlab];
    titlab.text = @"发表时间";
    titlab.textAlignment = NSTextAlignmentRight;
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 1)];
    [cell.contentView addSubview:line];
    line.backgroundColor = [UIColor lightGrayColor];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [SearchCell new];
    }
    if (indexPath.row%2 == 0) {
        cell.TypeImage.image = [UIImage imageNamed:@"escrowAcct"];
    }else{
        cell.TypeImage.image = [UIImage imageNamed:@"gesturePswd1"];
    }
    
    cell.TypeName.text = [NSString stringWithFormat:@"%@",[_dataarr[indexPath.row] objectForKey:@"type"]];
    
    cell.InfoText.text = [NSString stringWithFormat:@"%@",[_dataarr[indexPath.row] objectForKey:@"title"]];
    
    cell.TimeLab.text = @"2016/01/27 16:41";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_searchtbdelegate respondsToSelector:@selector(closekeyboard)]) {
        [_searchtbdelegate closekeyboard];
    }
}

@end
