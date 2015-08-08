//
//  ViewController.m
//  WJCommboxDemo
//
//  Created by jh navi on 15/8/6.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "WJCommboxView.h"

#define kMainWidth    [[UIScreen mainScreen] bounds].size.width
#define kMainHeight   [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@property(nonatomic,strong)WJCommboxView *cityCombox;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cityArray = [[NSArray alloc]initWithObjects:@"北京市",@"天津市",@"上海市",@"重庆市",@"广州市",@"深圳市",@"长沙市",@"武汉市",
                      @"桂林市",@"东莞市",@"佛山市",@"邵阳市",@"拉萨市",@"郑州市",@"苏州市",@"太原市",nil];
    
    self.cityCombox = [[WJCommboxView alloc] initWithFrame:CGRectMake(80, 200, 150, 30)];
    self.cityCombox.textField.placeholder = @"请选择城市";
    self.cityCombox.textField.textAlignment = UITextAlignmentLeft;
    self.cityCombox.textField.tag = 101;
    self.cityCombox.dataArray = self.cityArray;
    [self.view addSubview:self.cityCombox];
    
    self.comBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainWidth, kMainHeight+300)];
    self.comBackView.backgroundColor = [UIColor clearColor];
    self.comBackView.alpha = 0.5;
    UITapGestureRecognizer *singleTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commboxHidden)];
    [self.comBackView addGestureRecognizer:singleTouch];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commboxAction:) name:@"commboxNotice"object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commboxAction2:) name:@"commboxNotice2"object:nil];
    

}

- (void)commboxAction:(NSNotification *)notif{
    switch ([notif.object integerValue]) {
        case 101:
            [self.self.cityCombox removeFromSuperview];
            [self.view addSubview:self.comBackView];
            [self.view addSubview:self.cityCombox];
            break;
        default:
            break;
    }
    
}

- (void)commboxAction2:(NSNotification *)notif{
    
    [self.comBackView removeFromSuperview];
}

- (void)commboxHidden{
    [self.comBackView removeFromSuperview];
    
    [self.cityCombox setShowList:NO];
    self.cityCombox.listTableView.hidden = YES;
    
    CGRect sf = self.cityCombox.frame;
    sf.size.height = 30;
    self.cityCombox.frame = sf;
    CGRect frame = self.cityCombox.listTableView.frame;
    frame.size.height = 0;
    self.cityCombox.listTableView.frame = frame;
    
    
    [self.cityCombox removeFromSuperview];
    [self.view addSubview:self.cityCombox];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
