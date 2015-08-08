//
//  WJCommboxView.m
//  zlDSA
//
//  Created by jh navi on 15/7/23.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "WJCommboxView.h"

#define kFont [UIFont systemFontOfSize:14]


@implementation WJCommboxView


-(id)initWithFrame:(CGRect)frame
{
    if (frame.size.height<200) {
        self.frameHeight = 200;
    }else{
        self.frameHeight = frame.size.height;
    }
    self.tableHeight = self.frameHeight-50;
    
    frame.size.height = 30.0f;
    
    self=[super initWithFrame:frame];
    
    if(self){
        self.showList = NO; //默认不显示下拉框
        
        self.listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width, 0)];
        self.listTableView.delegate = self;
        self.listTableView.dataSource = self;
        self.listTableView.backgroundColor = [UIColor clearColor];
        self.listTableView.separatorColor = [UIColor lightGrayColor];
        self.listTableView.hidden = YES;
        self.listTableView.showsHorizontalScrollIndicator = NO;
        self.listTableView.showsVerticalScrollIndicator = NO;
        self.listTableView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.listTableView.frame)+20);
        self.listTableView.layer.borderWidth = 0.3;    //边框
        self.listTableView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        [self addSubview:self.listTableView];
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        self.textField.delegate = self;
        self.textField.textAlignment = UITextAlignmentCenter;  //对齐
        //右边图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15,10)];
        imageView.image = [UIImage imageNamed:@"narrow.png"];
        self.textField.rightView=imageView;
        self.textField.rightViewMode = UITextFieldViewModeAlways;
        self.textField.font = kFont;
        self.textField.borderStyle = UITextBorderStyleRoundedRect;//设置文本框的边框风格
        [self addSubview:self.textField];
        
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField; {
    [self dropdown];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"commboxNotice" object:@(textField.tag)];
    return NO;
}
-(void)dropdown{
   
    [self.textField resignFirstResponder];
    if (!self.listTableView.hidden) {//如果下拉框已显示，则进行隐藏
        self.showList = NO;
        self.listTableView.hidden = YES;
        
        CGRect sf = self.frame;
        sf.size.height = 30;
        self.frame = sf;
        CGRect frame = self.listTableView.frame;
        frame.size.height = 0;
        self.listTableView.frame = frame;
    }else {//如果下拉框尚未显示，则进行显示
        
        CGRect sf = self.frame;
        sf.size.height = self.frameHeight;
        
        //把dropdownList放到前面，防止下拉框被别的控件遮住
        [self.superview bringSubviewToFront:self];
        self.listTableView.hidden = NO;
        self.showList = YES;//显示下拉框
        
        CGRect frame = self.listTableView.frame;
        frame.size.height = 0;
        self.listTableView.frame = frame;
        frame.size.height = self.tableHeight;
        [UIView beginAnimations:@"WJCommbox" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.frame = sf;
        self.listTableView.frame = frame;
        [UIView commitAnimations];
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.dataArray objectAtIndex:[indexPath row]];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.textField.text = [self.dataArray objectAtIndex:[indexPath row]];
    if (self.textField.text.length > 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"commboxNotice2" object:@(self.textField.tag)];
    }
    self.showList = NO;
    self.listTableView.hidden = YES;
    
    CGRect sf = self.frame;
    sf.size.height = 30;
    self.frame = sf;
    CGRect frame = self.listTableView.frame;
    frame.size.height = 0;
    self.listTableView.frame = frame;
}


@end
