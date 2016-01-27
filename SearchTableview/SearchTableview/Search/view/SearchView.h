//
//  SearchView.h
//  SearchTableview
//
//  Created by 李阳 on 16/1/27.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchView : UIView
@property(nonatomic,strong) UISearchBar *searchbar;
@property(nonatomic,strong) UIButton *searchBtn;
@property(nonatomic,copy) void(^SearchBlock)(int);
@end
