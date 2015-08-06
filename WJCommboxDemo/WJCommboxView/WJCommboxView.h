//
//  WJCommboxView.h
//  zlDSA
//
//  Created by jh navi on 15/7/23.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJCommboxView : UIView<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate >

@property (nonatomic,strong) UITableView *listTableView;//下拉列表
@property (nonatomic,strong) NSArray *dataArray;//下拉列表数据
@property (nonatomic,strong) UITextField *textField;//文本输入框
@property (nonatomic,assign) BOOL showList;//是否弹出下拉列表
@property (nonatomic,assign) CGFloat tableHeight;//table下拉列表的高度
@property (nonatomic,assign)  CGFloat frameHeight;//frame的高度

@end
