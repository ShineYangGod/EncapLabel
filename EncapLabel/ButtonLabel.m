//
//  ButtonLabel.m
//  EncapLabel
//
//  Created by 杨晨 on 2017/1/5.
//  Copyright © 2017年 杨晨. All rights reserved.
//

#import "ButtonLabel.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation ButtonLabel
{
    //图片
    UIImageView *iconImage;
    //文字
    UILabel *textLabel;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)initLabel:(NSArray *)titleName labelImage:(NSArray *)imageArray
{
//    NSArray *titleName = @[@"待付款",@"待发货",@"待收货",@"待评价",@"退款/售后"];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 70, 30)];
    self.titleLabel.textColor =[UIColor blackColor];
    self.titleLabel.text = @"我的订单";
    self.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    [self addSubview: self.titleLabel];
    
    //箭头
    UIImageView *letArrowImage= [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30, 15, 15/2, 30/2)];
    letArrowImage.image = [UIImage imageNamed:@"more"];
    [self addSubview:letArrowImage];
    
    //横线
    UIView *line = [[UIView alloc]init];
    line.frame = CGRectMake(10, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height+2, SCREEN_WIDTH, 1);
    line.backgroundColor = UIColorFromRGB(0xEAEAEA);
    [self addSubview:line];
    
    //创建按钮
    for (int i = 0; i <titleName.count; i++) {
        
        iconImage = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/titleName.count-30)/2+i*(SCREEN_WIDTH/titleName.count-10)-5, line.frame.origin.y+line.frame.size.height+10, 60, 30)];
        iconImage.tag = i;
        iconImage.userInteractionEnabled = YES;
        iconImage.backgroundColor = [self randomColor];
        iconImage.image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
        [self addSubview:iconImage];
        
        UITapGestureRecognizer *imageTapGestur = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
        [iconImage addGestureRecognizer:imageTapGestur];
        
        textLabel = [[UILabel alloc]init];
        textLabel.frame = CGRectMake((SCREEN_WIDTH/titleName.count-30)/2+i*(SCREEN_WIDTH/titleName.count-10)-5, iconImage.frame.origin.y+iconImage.frame.size.height, 60, 30);
        textLabel.tag = i;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.text = [titleName objectAtIndex:i];
        textLabel.textColor = [UIColor blackColor];
        textLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:textLabel];
    }
    
}
//触摸图片的事件
- (void)handleSwipeFrom:(UITapGestureRecognizer*)recognizer {
    NSLog(@"点击的是---%ld",recognizer.view.tag);
    
}
//随机颜色
-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
