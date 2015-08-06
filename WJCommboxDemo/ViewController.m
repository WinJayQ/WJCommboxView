//
//  ViewController.m
//  WJCommboxDemo
//
//  Created by jh navi on 15/8/6.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "WJCommboxView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cityArray = [[NSArray alloc]initWithObjects:@"北京市",@"天津市",@"上海市",@"重庆市",@"广州市",@"深圳市",@"长沙市",@"武汉市",
                      @"桂林市",@"东莞市",@"佛山市",@"邵阳市",@"拉萨市",@"郑州市",@"苏州市",@"太原市",nil];
    
    WJCommboxView *cityCombox = [[WJCommboxView alloc] initWithFrame:CGRectMake(80, 200, 150, 30)];
    cityCombox.textField.placeholder = @"请选择城市";
    cityCombox.textField.textAlignment = UITextAlignmentLeft;
    cityCombox.dataArray = self.cityArray;
    [self.view addSubview:cityCombox];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
