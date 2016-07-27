//
//  AllOrderListViewController.m
//  AllOrderList
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "AllOrderListViewController.h"
#import "OrderTableView.h"
#import "OrderModel.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface AllOrderListViewController ()
{
    
    BOOL isbool;
    
    BOOL editbool;
    
    NSString *numString;
    
    OrderTableView *shopping;
    
    NSArray *cellArray;
}
@end

@implementation AllOrderListViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setInit];
}

-(void)setInit{
    numString = @"0";
//    [Util setFoursides:_naviView Direction:@"bottom" sizeW:SCREEN_WIDTH];
    
    shopping = [[OrderTableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:shopping];
    
    [self setData];
    
}



#pragma mark 数据
-(void)setData{
    
    
    NSDictionary *dicts = @{
                            @"item":@[
                                    @{
                                        @"headID":@"10",
                                        @"headState":@1,
                                        @"sellerName":@"小宝手机店",
                                        @"orderState":@1,
                                        @"discount":@"9",
                                        @"headCellArray":@[
                                                @{
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@1,
                                                    @"ID":@"10",
                                                    },
                                                @{
                                                    
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@1,
                                                    @"ID":@"11",
                                                    },
                                                @{
                                                    
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@0,
                                                    @"ID":@"12",
                                                    },
                                                ]
                                        
                                        },
                                    @{
                                        @"headID":@"11",
                                        @"headState":@1,
                                        @"sellerName":@"小宝手机店",
                                        @"orderState":@2,
                                        @"discount":@"9",
                                        @"headCellArray":@[
                                                @{
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@1,
                                                    @"ID":@"13",
                                                    },
                                                @{
                                                    
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@0,
                                                    @"ID":@"14",
                                                    },
                                                ]
                                        
                                        },
                                    @{
                                        @"headID":@"10",
                                        @"headState":@1,
                                        @"sellerName":@"小宝手机店",
                                        @"orderState":@3,
                                        @"discount":@"9",
                                        @"headCellArray":@[
                                                @{
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@0,
                                                    @"ID":@"15",
                                                    },
                                                
                                                ]
                                        
                                        },
                                    @{
                                        @"headID":@"10",
                                        @"headState":@1,
                                        @"sellerName":@"小宝手机店",
                                        @"orderState":@4,
                                        @"discount":@"9",
                                        @"headCellArray":@[
                                                @{
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@0,
                                                    @"ID":@"16",
                                                    },
                                                
                                                ]
                                        
                                        },
                                    @{
                                        @"headID":@"10",
                                        @"headState":@1,
                                        @"sellerName":@"小宝手机店",
                                        @"orderState":@5,
                                        @"discount":@"9",
                                        @"headCellArray":@[
                                                @{
                                                    @"imageUrl":@"headurl.png",
                                                    @"title":@"iPhone 6s国行公开版5.7寸大屏幕",
                                                    @"color":@"浅蓝",
                                                    @"size":@"s",
                                                    @"price":@"100.00",
                                                    @"numInt":@2,
                                                    @"inventoryInt":@10,
                                                    @"mustInteger":@0,
                                                    @"ID":@"16",
                                                    },
                                                
                                                ]
                                        
                                        },
                                    
                                    
                                    ]
                            };
    
    
    NSMutableArray *arrayl = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in dicts[@"item"]) {
        
        NSMutableArray *dictarray = [[NSMutableArray alloc] init];
        OrderModel *model = [[OrderModel alloc] initWithShopDict:dict];
        [dictarray addObject:model];
        
        [arrayl addObject:model];
        
    }
    
    shopping.shoppingArray = arrayl;
    
}


#pragma mark 返回
- (IBAction)ReturnBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
