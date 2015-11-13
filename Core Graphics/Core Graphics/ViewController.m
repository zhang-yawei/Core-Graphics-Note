//
//  ViewController.m
//  Core Graphics
//
//  Created by zhang on 15/11/13.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray *VCArray;
@property(nonatomic,copy)NSArray *detailArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.VCArray = @[@"firstView",@"secondView"];
    self.detailArray = @[@"在UIView的子类方法drawRect：中绘制一个蓝色圆",@"使用Core Graphics实现绘制蓝色圆。"];

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
