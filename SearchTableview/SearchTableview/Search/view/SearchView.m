//
//  SearchView.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/27.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView
@synthesize searchbar,searchBtn;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize mainsize = [UIScreen mainScreen].bounds.size;
        self.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:205.0/255 alpha:0.5];
        searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, mainsize.width, 50)];
        [self addSubview:searchbar];
        
        searchBtn = [UIButton new];
        [self addSubview:searchBtn];
        searchBtn.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:205.0/255 alpha:0.5];
        [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)search:(UIButton *)sender{
    if ([searchbar respondsToSelector:@selector(isFirstResponder)] && [searchbar isFirstResponder] ) {
        [searchbar resignFirstResponder];
    }
    
}
@end
