//
//  OrderTableView.h
//  AllOrderList
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *shoppingArray;


@end
