//
//  SearchTableView.h
//  SearchTableview
//
//  Created by 李阳 on 16/1/22.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SearchTableViewDelegate<NSObject>
@optional

@end

@interface SearchTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *dataarr;
@property (nonatomic,assign) id<SearchTableViewDelegate> searchtbdelegate;
@end
