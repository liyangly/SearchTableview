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
    NSArray *dataarr1;
    NSArray *dataarr2;
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
    dataarr1 = @[dict0,dict2,dict4,dict6];
    dataarr2= @[dict1,dict3,dict5];
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
    searchview.searchbar.frame = CGRectMake(0, 0, mainsize.width, 50);
    searchview.searchbar.scopeButtonTitles = @[@"cancle",@"取消"];
    searchview.searchbar.selectedScopeButtonIndex = 1;
    searchview.searchbar.showsCancelButton = YES;
    searchtableview.frame = CGRectMake(0, 20+60, mainsize.width, mainsize.height-124+44);
    
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    self.navigationController.navigationBarHidden = NO;
    CGSize mainsize = [UIScreen mainScreen].bounds.size;
    searchview.frame = CGRectMake(0, 64, mainsize.width, 50);
    searchview.searchbar.frame = CGRectMake(0, 0, mainsize.width, 50);
    searchview.searchbar.showsCancelButton = NO;
    searchtableview.frame = CGRectMake(0, 64+60, mainsize.width, mainsize.height-124);
    if ([searchview.searchbar.text isEqualToString:@""]){
        NSLog(@"null");
        searchtableview.dataarr = dataarr;
        [searchtableview reloadData];
    }
    
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED{
    [self closekeyboard];
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0){
    if([searchview.searchbar.text isEqualToString:@"语言"]){
        NSLog(@"语言");
        searchtableview.dataarr = dataarr1;
        
    }else if ([searchview.searchbar.text isEqualToString:@"文字"]){
        NSLog(@"文字");
        searchtableview.dataarr = dataarr2;
    }
    [searchtableview reloadData];
    return YES;
}
-(void)closekeyboard{
    if ([searchview.searchbar respondsToSelector:@selector(isFirstResponder)] && [searchview.searchbar isFirstResponder] ) {
        [searchview.searchbar resignFirstResponder];
    }
}
@end
