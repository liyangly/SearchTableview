//
//  SearchTBViewController.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/22.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "SearchTBViewController.h"
#import "UIColor+Util.h"
extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));
static size_t const count = 1000;
static size_t const iterations = 10000;
id object = @"🐷";
@interface SearchTBViewController ()
{
    UIView *container;
    SearchView *searchview;
    SearchTableView *searchtableview;
    NSArray *dataarr;
}
@end

@implementation SearchTBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    NSDictionary *dict0 = @{@"type":@"语言",@"title":@"汉语是什么怎么怎么地"};
    NSDictionary *dict1 = @{@"type":@"文字",@"title":@"象形文字是什么怎么怎么地"};
    NSDictionary *dict2 = @{@"type":@"语言",@"title":@"汉语是什么怎么怎么地"};
    NSDictionary *dict3 = @{@"type":@"文字",@"title":@"罗马文字是什么怎么怎么地"};
    NSDictionary *dict4 = @{@"type":@"语言",@"title":@"汉语是什么怎么怎么地"};
    NSDictionary *dict5 = @{@"type":@"文字",@"title":@"楔形文字是什么怎么怎么地"};
    NSDictionary *dict6 = @{@"type":@"语言",@"title":@"汉语是什么怎么怎么地"};
    NSDictionary *dict7 = @{@"type":@"国家",@"title":@"中国是什么怎么怎么地"};
    NSDictionary *dict8 = @{@"type":@"国家",@"title":@"日本是什么怎么怎么地"};
    NSDictionary *dict9 = @{@"type":@"国家",@"title":@"韩国是什么怎么怎么地"};
    dataarr = @[dict0,dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8,dict9];
    [self initlayout];
}

-(void)initlayout{
    CGSize mainsize = [UIScreen mainScreen].bounds.size;
    
    searchview = [[SearchView alloc] initWithFrame:CGRectMake(0, 64, mainsize.width, 50)];
    [self.view addSubview:searchview];
    searchview.searchbar.delegate = self;
    
    searchtableview = [[SearchTableView alloc] initWithFrame:CGRectMake(0, 64+60, mainsize.width, mainsize.height-124)];
    [self.view addSubview:searchtableview];
    searchtableview.searchtbdelegate = self;
    searchtableview.dataarr = dataarr;
    
    uint64_t t = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSMutableArray *mutableArray = [NSMutableArray array];
            for (size_t i = 0; i < count; i++) {
                [mutableArray addObject:object];
            }
        }
    });
    NSLog(@"[[NSMutableArray array] addObject:] Avg. Runtime: %llu ns", t);
    
    uint64_t t_0 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSMutableArray *mutableArray = [NSMutableArray array];
            for (size_t i = 0; i < count; i++) {
                [mutableArray addObject:object];
            }
        }
    });
    NSLog(@"[[NSMutableArray array] addObject:] Avg. Runtime: %llu ns", t_0);
    
    uint64_t t_1 = dispatch_benchmark(iterations, ^{
        @autoreleasepool {
            NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:count];
            for (size_t i = 0; i < count; i++) {
                [mutableArray addObject:object];
            }
        }
    });
    NSLog(@"[[NSMutableArray arrayWithCapacity] addObject:] Avg. Runtime: %llu ns", t_1);
    
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    self.navigationController.navigationBarHidden = YES;
    CGSize mainsize = [UIScreen mainScreen].bounds.size;
    searchview.frame = CGRectMake(0, 20, mainsize.width, 50);
    searchview.searchbar.frame = CGRectMake(0, 0, mainsize.width-100, 50);
    searchtableview.frame = CGRectMake(0, 20+60, mainsize.width, mainsize.height-124);
    
    searchview.searchBtn.frame = CGRectMake(mainsize.width-90, 3, 90, 44);
    
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    self.navigationController.navigationBarHidden = NO;
    CGSize mainsize = [UIScreen mainScreen].bounds.size;
    searchview.frame = CGRectMake(0, 64, mainsize.width, 50);
    searchview.searchbar.frame = CGRectMake(0, 0, mainsize.width, 50);
    searchtableview.frame = CGRectMake(0, 64+60, mainsize.width, mainsize.height-124);
    
    searchview.searchBtn.frame = CGRectMake(mainsize.width-90, 3, 0, 44);
    
    return YES;
}

@end
