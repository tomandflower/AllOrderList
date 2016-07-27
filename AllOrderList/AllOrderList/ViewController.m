//
//  ViewController.m
//  AllOrderList
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "ViewController.h"
#import "AllOrderListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)checkAllOrderList:(id)sender {
    AllOrderListViewController *allOrderList = [[AllOrderListViewController alloc] init];
    UINavigationController *hom1Navi = [[UINavigationController alloc]initWithRootViewController:allOrderList];
    [self presentViewController:hom1Navi animated:YES completion:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
