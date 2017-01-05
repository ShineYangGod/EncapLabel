//
//  ViewController.m
//  EncapLabel
//
//  Created by 杨晨 on 2017/1/5.
//  Copyright © 2017年 杨晨. All rights reserved.
//

#import "ViewController.h"
#import "ButtonLabel.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =UIColorFromRGB(0xF5F5F5);
     NSArray *titleName = @[@"待付款",@"待发货",@"待收货",@"待评价",@"退款/售后"];
    ButtonLabel *text = [[ButtonLabel alloc]initWithFrame:CGRectMake(0, 100, 100, 30)];
    [text initLabel:titleName labelImage:nil];
    [self.view addSubview:text];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
