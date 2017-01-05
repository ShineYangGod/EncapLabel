//
//  ButtonLabel.h
//  EncapLabel
//
//  Created by 杨晨 on 2017/1/5.
//  Copyright © 2017年 杨晨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonLabel : UILabel

//标题
@property(strong,nonatomic)UILabel *titleLabel;

-(void)initLabel:(NSArray *)titleName labelImage:(NSArray *)imageArray;
@end
