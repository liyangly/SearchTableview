//
//  SearchTBViewController.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/22.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "SearchTBViewController.h"

@interface SearchTBViewController ()
{
    SearchTableView *searchtableview;
    NSArray *dataarr;
}
@end

@implementation SearchTBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    NSDictionary *dict0 = @{@"type":@"语言",@"title":@"汉语"};
    NSDictionary *dict1 = @{@"type":@"文字",@"title":@"象形文字"};
    NSDictionary *dict2 = @{@"type":@"语言",@"title":@"汉语"};
    NSDictionary *dict3 = @{@"type":@"文字",@"title":@"罗马文字"};
    NSDictionary *dict4 = @{@"type":@"语言",@"title":@"汉语"};
    NSDictionary *dict5 = @{@"type":@"文字",@"title":@"楔形文字"};
    NSDictionary *dict6 = @{@"type":@"语言",@"title":@"汉语"};
    NSDictionary *dict7 = @{@"type":@"国家",@"title":@"中国"};
    NSDictionary *dict8 = @{@"type":@"国家",@"title":@"日本"};
    NSDictionary *dict9 = @{@"type":@"国家",@"title":@"韩国"};
    dataarr = @[dict0,dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8,dict9];
    [self initlayout];
}

-(void)initlayout{
    CGSize mainsize = [UIScreen mainScreen].bounds.size;
    UISearchBar *searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, mainsize.width, 50)];
    [self.view addSubview:searchbar];
    searchbar.delegate = self;
    searchtableview = [[SearchTableView alloc] initWithFrame:CGRectMake(0, 64+60, mainsize.width, mainsize.height-124)];
    [self.view addSubview:searchtableview];
    searchtableview.searchtbdelegate = self;
    searchtableview.dataarr = dataarr;
    
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    self.navigationController.navigationBarHidden = YES;
    
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    self.navigationController.navigationBarHidden = NO;
    
    return YES;
}
@end
