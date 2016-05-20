//
//  ViewController.m
//  Core Graphics
//
//  Created by zhang on 15/11/13.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "firstView.h"
#import "secondView.h"
#import "thirdView.h"
#import "fourthView.h"
#import "fivethView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray *VCArray;
@property(nonatomic,copy)NSArray *detailArray;

@end


// 参考文档:http://www.cocoachina.com/industry/20140115/7703.html
/*
 
 Core Graphics Api 所有的操作都是在一个上下文中进行的.所以在绘图的时候,要获取到这个上下文.可以把上下文理解成一块画布.比较常用的获取上下文的方式:
    
    1.创建一个图片类型的上下文.调用UIGraphicsBeginImageContenxWithOption函数就可以获得用来处理图片的图形上下文.你就可以在上面进行绘图,并生成图片.用函数UIGraphicsBeginImageFromCurrentImageContrxt 函数可以从当前上下文中获取一个UIimage对象.在所有的绘图操作后要用UIGraphicsEndImageContext函数关闭图形上下文.
 
    2. 利用cocoa 生成的图形上下文,当子类化一个UIView并且实现了自己的drwaRect:方法,一旦这个方法被调用,cocoa就会创建要给图形上下文,此时对图像所有的绘制都会显示到UIView上.
 
 注:1.UIGraphicsBegainContextWithOptions 函数不仅仅创建了一个适用图形操作的上下文,这个上下文也属于当前上下文.
    2.当drawRect:方法被调用的时候,UIView的绘图上下文属于当前上下文.
    3.回调方法所持有的context:参数并不会让任何的上下文成为当前图形上下文,这只是对上下文的一个引用.
 
 
 
 UIKit 和 CoreGraphics 两个支持绘图的框架
 
 UIKit 像 UIImage,NSString,UIBezierPath UIColor都知道如何绘制自己,这些类提供了功能有限但是很方便的方法让我们完成绘图任务.
     适用UIKit,你只能在当前上下文中绘图,所以当你处于UIGraphicsBeginImageContrxtWithOPtion 函数或者draoRect:方法中,就可以直接适用UIKit进行绘图,在使用UIKit提供的方法之前,必须将该上下文参数转化为当前上下文.调用UIGraphicsPushContext 函数可以很方便的将context:参数转化为当前上下文.最后适用UIGraphicsPopContext回复上下文环境.
 
 CoreGraphics 是一个绘图专用的API族,是所有绘图功能的基石.包括UIKit
        适用CoreGraphics 之前需要指定一个用于绘图的图形上下文,(CGContextRef),这个图形上下文在每一个绘图函数中都会被用到,如果你持有一个图形上下文context:参数,那么就等于有了一个图形上下文.
            如果当前处于UIGRaphicsBeginImageContexOption 或者drawRect:方法中,并没有引用一个上下文,为了使用Core Graphics,可以调用方法UIGraphicsGetCurrentContext函数来获取当前上下文.
 
 
    那么,获取上下文有三种方法:drawRect:、drawRect: inContext:、UIGraphicsBeginImageContextWithOptions
    绘图有两种  UIKit , Coreraphics
    
    所以共有六种组合可供使用.
 

 
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.VCArray = @[@"firstView",@"secondView",@"thirdView",@"fourthView",@"fivethView",@"sixthView"];
    self.detailArray = @[@"在UIView的子类方法drawRect：中绘制一个蓝色圆",@"使用Core Graphics实现绘制蓝色圆。",@"在UIView子类的drawLayer:inContext：方法中实现绘图任务",@" 使用Core Graphics在drawLayer:inContext：方法中实现同样操作",@" 使用UIKit实现：",@"123"];

    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"selftableviewcell"];
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return self.VCArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selftableviewcell"];
    
    cell.detailTextLabel.text = [self.detailArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [self.detailArray objectAtIndex:indexPath.row];
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     Class ViewClass = NSClassFromString([self.VCArray objectAtIndex:indexPath.row]);
    DetailViewController *VC = [[DetailViewController alloc]init];
    VC.myView = [[ViewClass alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
