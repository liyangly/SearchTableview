//
//  SearchView.m
//  SearchTableview
//
//  Created by 李阳 on 16/1/27.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView
@synthesize searchbar;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize mainsize = [UIScreen mainScreen].bounds.size;
        searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, mainsize.width, 50)];
        searchbar.barTintColor = [UIColor colorWithRed:217.0/255 green:217.0/255 blue:217.0/255 alpha:1.0];
        [self addSubview:searchbar];
        searchbar.placeholder = @"搜索";
        
    }
    return self;
}
-(void)search:(UIButton *)sender{
    if ([searchbar respondsToSelector:@selector(isFirstResponder)] && [searchbar isFirstResponder] ) {
        [searchbar resignFirstResponder];
    }
    
}
@end
