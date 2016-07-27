//
//  OrderModel.h
//  AllOrderList
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

@property (nonatomic, copy) NSDictionary *headPriceDict;

//头部 id
@property (nonatomic, copy) NSString *headID;

//卖家 名称
@property (nonatomic, copy) NSString *sellerName;

//订单 状态
@property (nonatomic, assign) NSInteger orderState;//1.等待买家付款 2.买家已付款 3.卖家已发货 4.交易成功 5.交易关闭

//头部 状态
@property (nonatomic, assign) NSInteger headState;

//头部 选中状态
@property (nonatomic, assign) NSInteger headClickState;

//分组数据
@property (nonatomic, copy) NSMutableArray *headCellArray;

//折扣力度（head）
@property (nonatomic, copy) NSString *discount;

-(instancetype)initWithShopDict:(NSDictionary *)dict;

@end



//cell
@interface OrderCellModel : NSObject

@property (nonatomic, copy) NSDictionary *cellPriceDict;

//编辑状态
@property (nonatomic, assign) NSInteger cellEditState;

//图片
@property (nonatomic, copy) NSString *imageUrl;

//标题
@property (nonatomic, copy) NSString *title;

//颜色
@property (nonatomic, copy) NSString *color;

//尺码
@property (nonatomic, copy) NSString *size;

//价格
@property (nonatomic, copy) NSString *price;

//数量
@property (nonatomic, assign) NSInteger numInt;

//库存
@property (nonatomic, assign) NSInteger inventoryInt;

//必选
@property (nonatomic, assign) NSInteger mustInteger;

//ID
@property (nonatomic, copy)  NSString *ID;

//折扣
@property (nonatomic, copy) NSString *discountNum;

//cell 选中状态
@property (nonatomic, assign) NSInteger cellClickState;

@property (nonatomic, assign) NSInteger row;

@property (nonatomic, assign) NSInteger section;

@property (nonatomic, assign) NSInteger indexState;

-(instancetype)initWithShopDict:(NSDictionary *)dict;

@end
