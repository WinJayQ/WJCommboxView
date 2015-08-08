# WJCommboxView
实现下拉框选择，点击弹开与收回。点击背景，下拉列表自动隐藏。


##使用方法
###1)将Demo中的WJCommboxView.h，WJCommboxView.m文件拷贝到项目中
###2)在你的视图控制器中如下使用：
    self.cityArray = [[NSArray alloc]initWithObjects:@"北京市",@"天津市",@"上海市",@"重庆市",@"广州市",@"深圳市",@"长沙市",@"武汉市", @"桂林市",@"东莞市",@"佛山市",@"邵阳市",@"拉萨市",@"郑州市",@"苏州市",@"太原市",nil];
    
    WJCommboxView *cityCombox = [[WJCommboxView alloc] initWithFrame:CGRectMake(80, 200, 150, 30)];
    cityCombox.textField.placeholder = @"请选择城市";
    cityCombox.dataArray = self.cityArray;  //城市数组
    [self.view addSubview:cityCombox];



##效果图
![WJCommbox](https://github.com/WinJayQ/WJCommboxView/raw/master/WJCommboxDemo/wjbox.gif) 
