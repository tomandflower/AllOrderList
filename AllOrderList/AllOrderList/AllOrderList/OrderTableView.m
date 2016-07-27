//
//  OrderTableView.m
//  AllOrderList
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "OrderTableView.h"
#import "OrderModel.h"
#import "OrderTableViewCell.h"

#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface OrderTableView ()
{
    NSString *orderStateStr;
}
@end

@implementation OrderTableView

-(id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self  = [super initWithFrame:frame style:style];
    if (self) {
        
        self.backgroundColor =UIColorRGBA(238, 238, 238, 1);
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = UIColorRGBA(221, 221, 221, 1);
        self.tableFooterView = [[UIView alloc]init];
        self.showsVerticalScrollIndicator = NO;
        if ([self respondsToSelector:@selector(setSeparatorInset:)])
        {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self respondsToSelector:@selector(setLayoutMargins:)])
        {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return self;
}


-(void)setShoppingArray:(NSMutableArray *)shoppingArray{
    
    if (_shoppingArray != shoppingArray) {
        
        _shoppingArray = shoppingArray;
        
        [self reloadData];
        
    }
}


#pragma mark 分割线去掉左边15个像素
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    
    OrderModel *headModel = _shoppingArray[section];
    if (headModel.headState == 1) {
        
        return 40;
        
    }else if (headModel.headState == 2){
        
        return 40;
        
    }else{
        
        return 0.0001;
    }
    
}

#pragma mark头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    OrderModel *headModel = _shoppingArray[section];
    if (headModel.headState == 1) {
        
        switch (headModel.orderState) {
            case 1:
                orderStateStr = @"等待买家付款";
                break;
                
            case 2:
                orderStateStr = @"买家已付款";
                break;
                
            case 3:
                orderStateStr = @"卖家已发货";
                break;
                
            case 4:
                orderStateStr = @"交易成功";
                break;
                
            case 5:
                orderStateStr = @"交易关闭";
                break;
                
            default:
                break;
        }
        
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        view.backgroundColor = [UIColor whiteColor];
        
        UIButton * gotoShopBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        gotoShopBtn.backgroundColor = [UIColor clearColor];
        [gotoShopBtn addTarget:self action:@selector(gotoShopAction) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:gotoShopBtn];
        
        UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 20, 20)];
        titleImageView.image = [UIImage imageNamed:@"Home-50"];
        [view addSubview:titleImageView];
        
//        [Util setFoursides:view Direction:@"top" sizeW:SCREEN_WIDTH];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 120, 20)];
        label.textColor = [UIColor grayColor];
        label.text = headModel.sellerName;
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:13.0];
        [view addSubview:label];
        
        UIImageView *arrowRightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(label.bounds.origin.x+label.bounds.size.width, 10, 20, 20)];
        arrowRightImageView.image = [UIImage imageNamed:@"arrows_right_s"];
        [view addSubview:arrowRightImageView];
        
        
        UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-140, 10, 120, 20)];
        statusLabel.textColor = [UIColor redColor];
        statusLabel.text = orderStateStr;
        statusLabel.textAlignment = NSTextAlignmentRight;
        statusLabel.font = [UIFont systemFontOfSize:13.0];
        [view addSubview:statusLabel];
        
        
        return  view;
        
    }else if (headModel.headState == 2){
        
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        view.backgroundColor = [UIColor blueColor];
        return  view;
        
    }
    
    
    return nil ;
}


#pragma mark 底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    OrderModel *forModel = _shoppingArray[section];
    
    if (forModel.headState == 1) {
        
        return 100;
        
    }else {
        
        return 10;
    }
    
}

#pragma mark底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    OrderModel *forModel = _shoppingArray[section];
    if (forModel.headState == 1) {
        
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        view.backgroundColor = [UIColor whiteColor];
        
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, SCREEN_WIDTH -55, 40)];
        priceLabel.backgroundColor = [UIColor whiteColor];
        priceLabel.textColor = [UIColor grayColor];
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.text = @"小计:￥00.00";
        priceLabel.font = [UIFont systemFontOfSize:12.0];
        [view addSubview:priceLabel];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 41, SCREEN_WIDTH, 0.3)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [view addSubview:lineView];
        
        UIButton *actionBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 50, 60, 30)];
        actionBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [actionBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        actionBtn.layer.cornerRadius = 5;
        actionBtn.layer.borderWidth = 0.5;
        [actionBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:actionBtn];
        
        UIButton *orderActionBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 160, 50, 60, 30)];
        orderActionBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [orderActionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        orderActionBtn.layer.cornerRadius = 5;
        orderActionBtn.layer.borderWidth = 0.5;
        [orderActionBtn addTarget:self action:@selector(buttonActionTwo:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:orderActionBtn];
//        [Util makeCorner:5 view:orderActionBtn];
        
        switch (forModel.orderState) {
            case 1:
                actionBtn.tag = 1;
                orderActionBtn.tag = 1;
                [actionBtn setTitle:@"付款" forState:UIControlStateNormal];
                [orderActionBtn setTitle:@"取消订单" forState:UIControlStateNormal];
                break;
                
            case 2:
                actionBtn.tag = 2;
                orderActionBtn.tag = 1;
                [actionBtn setTitle:@"提醒发货" forState:UIControlStateNormal];
                [orderActionBtn setTitle:@"取消订单" forState:UIControlStateNormal];
                break;
                
            case 3:
                actionBtn.tag = 3;
                orderActionBtn.tag = 3;
                [actionBtn setTitle:@"确认收货" forState:UIControlStateNormal];
                [orderActionBtn setTitle:@"查看物流" forState:UIControlStateNormal];
                break;
                
            case 4:
                actionBtn.tag = 4;
                orderActionBtn.tag = 4;
                [actionBtn setTitle:@"取消订单" forState:UIControlStateNormal];
                [orderActionBtn setTitle:@"提醒发货" forState:UIControlStateNormal];
                break;
                
            case 5:
                orderActionBtn.tag = 5;
                actionBtn.hidden = YES;
                [orderActionBtn setFrame:CGRectMake(SCREEN_WIDTH - 80, 50, 60, 30)];
                [orderActionBtn setTitle:@"删除订单" forState:UIControlStateNormal];
                break;
                
            default:
                break;
        }
        
        //每条数据下面的总价
        CGFloat allprice = 0.00;
        NSInteger amout = 0;
        for (OrderCellModel *cellmodel in forModel.headCellArray) {
            allprice = allprice + [cellmodel.price integerValue] * cellmodel.numInt;
            amout = amout + cellmodel.numInt;
        }
        priceLabel.text = [NSString stringWithFormat:@"共计%ld件商品，合计：¥%.2lf(含运费0.00)", amout, allprice];
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, view.bounds.size.height-10, SCREEN_WIDTH, 10)];
        bottomview.backgroundColor = UIColorRGBA(238, 238, 238, 1);
        
        [view addSubview:bottomview];
//        [Util setFoursides:bottomview Direction:@"top" sizeW:SCREEN_WIDTH];
        return  view;
        
    }else{
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 10)];
        bottomview.backgroundColor = UIColorRGBA(238, 238, 238, 1);
        return bottomview;
    }
    
    
    return nil ;
}

#pragma mark  返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _shoppingArray.count;
}

#pragma mark  每个分区多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    OrderModel *model = _shoppingArray[section];
    return model.headCellArray.count;
}

#pragma mark 改变行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}

#pragma mark 代理数据源
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifer=@"detacell";
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        
        cell=[[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    OrderModel *ordermodel = _shoppingArray[indexPath.section];
    OrderCellModel *cellmodel = ordermodel.headCellArray[indexPath.row];
    cellmodel.section = indexPath.section;
    cell.model = cellmodel;
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark  Button Methods
- (void)buttonAction:(UIButton *)sender {
    if (sender.tag == 1) {
        NSLog(@"1111");
    } else if (sender.tag == 2) {
        NSLog(@"2222");
    } else if (sender.tag == 3) {
        NSLog(@"333");
    } else if (sender.tag == 4) {
        NSLog(@"444");
    } else if (sender.tag == 5) {
        NSLog(@"555");
    }
    
}

- (void)buttonActionTwo:(UIButton *)sender {
    if (sender.tag == 1) {
        NSLog(@"aaa");
    } else if (sender.tag == 2) {
        NSLog(@"bbb");
    } else if (sender.tag == 3) {
        NSLog(@"ccc");
    } else if (sender.tag == 4) {
        NSLog(@"ddd");
    } else if (sender.tag == 5) {
        NSLog(@"eee");
    }
    
}

- (void)gotoShopAction {
    NSLog(@"Go to shop");
}

#pragma mark 响应选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
