//
//  OrderTableViewCell.m
//  AllOrderList
//
//  Created by tomandhua on 16/6/15.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "OrderTableViewCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface OrderTableViewCell ()


@end
@implementation OrderTableViewCell
{
    
    NSIndexPath *indexPath;
    
    //图片
    UIImageView *headImageView;
    
    //标题
    UILabel *titleLabel;
    
    //价格
    UILabel *priceLabel;
    
    //颜色&尺码
    UILabel *styleLabel;
    
    //数量
    UILabel * amountLabel;
    
}
- (void)awakeFromNib {
    
}



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        //图片
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 70, 70)];
        headImageView.backgroundColor = [UIColor whiteColor];
        
        //标题
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(headImageView.frame.origin.x + headImageView.frame.size.width +10, 15, SCREEN_WIDTH - (headImageView.frame.origin.x + headImageView.frame.size.width +91), 18)];
        titleLabel.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        titleLabel.font = [UIFont systemFontOfSize:14.0];
        
        //颜色 尺码
        styleLabel = [[UILabel alloc] initWithFrame:CGRectMake(headImageView.frame.origin.x + headImageView.frame.size.width +10, titleLabel.frame.origin.y + titleLabel.frame.size.height + 10, SCREEN_WIDTH-(titleLabel.bounds.origin.x + titleLabel.bounds.size.width) - 20, 18)];
        styleLabel.textColor = [UIColor grayColor];
        styleLabel.font = [UIFont systemFontOfSize:12.0];
        
        //价格
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(headImageView.frame.origin.x + headImageView.frame.size.width + 10, styleLabel.frame.origin.y + styleLabel.frame.size.height + 10, 70, 18)];
        priceLabel.textColor = [UIColor redColor];
        priceLabel.textAlignment = NSTextAlignmentLeft;
        priceLabel.font = [UIFont systemFontOfSize:12.0];
        
        //数量
        amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, styleLabel.frame.origin.y + styleLabel.frame.size.height + 10, 70, 18)];
        amountLabel.textColor = [UIColor grayColor];
        amountLabel.textAlignment = NSTextAlignmentRight;
        amountLabel.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:amountLabel];
        [self addSubview:headImageView];
        [self addSubview:titleLabel];
        [self addSubview:styleLabel];
        [self addSubview:priceLabel];
        
        
        
        
    }
    
    return  self;
}


-(void)setModel:(OrderCellModel *)model{
    
    _model = model;
    
    indexPath = [NSIndexPath indexPathForRow:model.row inSection:model.section];
    
    headImageView.image = [UIImage imageNamed:_model.imageUrl];
    titleLabel.text = model.title;
    styleLabel.text = [NSString stringWithFormat:@"颜色: %@",model.color];
    priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    amountLabel.text = [NSString stringWithFormat:@"x%ld", model.numInt];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end
