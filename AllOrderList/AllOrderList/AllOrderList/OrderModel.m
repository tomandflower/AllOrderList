//
//  OrderModel.m
//  AllOrderList
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

-(instancetype)initWithShopDict:(NSDictionary *)dict{
    
    self.headID = dict[@"headID"];
    
    self.orderState = [dict[@"orderState"] integerValue];
    
    self.sellerName = dict[@"sellerName"];
    
    self.headState = [dict[@"headState"] integerValue];
    
    self.discount  = dict[@"discount"];
    
    self.headCellArray = [NSMutableArray arrayWithArray:[self ReturnData:dict[@"headCellArray"]]];
    
    self.headClickState = 0;
    
    return self ;
}

-(NSArray *)ReturnData:(NSArray *)array{
    
    NSMutableArray *arrays= [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array) {
        
        OrderCellModel *model = [[OrderCellModel alloc] initWithShopDict:dict];
        [arrays addObject:model];
        
    }
    
    return arrays;
}


@end

@implementation OrderCellModel

@synthesize row;
@synthesize section;
@synthesize indexState;
@synthesize cellClickState;
@synthesize cellPriceDict;
@synthesize cellEditState;
-(instancetype)initWithShopDict:(NSDictionary *)dict{
    
    self.ID = dict[@"ID"];
    self.imageUrl = dict[@"imageUrl"];
    self.title = dict[@"title"];
    self.color = dict[@"color"];
    self.size = dict[@"size"];
    self.price =dict[@"price"];
    self.mustInteger = [dict[@"mustInteger"] integerValue];
    self.numInt = [dict[@"numInt"] integerValue];
    self.inventoryInt = [dict[@"inventoryInt"] integerValue];
    self.discountNum = dict[@"discountNum"];
    self.row = 0;
    self.section = 0;
    self.indexState = 0;
    self.cellClickState = 0;
    self.cellEditState = 0;
    self.cellPriceDict = [[NSDictionary alloc] init];
    return self ;
}

@end
