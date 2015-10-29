//
//  ViewController.m
//  Tableview
//
//  Created by zje on 15/10/29.
//  Copyright © 2015年 庄靖恩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *table1;
@property (nonatomic,strong) UITableView *table2;


@property (nonatomic,strong) UIButton *button1;
@property (nonatomic,strong) UIButton *button2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button1.frame = CGRectMake(0, 44, self.view.bounds.size.width / 2, 30);
    [self.button1 setTitle:@"第一个列表" forState:UIControlStateNormal];
    self.button1.backgroundColor = [UIColor greenColor];
    
    // 设置点击事件
    [self.button1 addTarget:self action:@selector(button1Action) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:self.button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button2.frame = CGRectMake(CGRectGetMaxX(self.button1.frame), 44, self.view.bounds.size.width / 2, 30);
    [self.button2 setTitle:@"第二个列表" forState:UIControlStateNormal];
    self.button2.backgroundColor = [UIColor yellowColor];
    
    // 设置点击事件
    [self.button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button2];
    
    
    [self button1Action];
    
}

- (void)button1Action
{
    if (self.table1 == nil) {
        self.table1 = [[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.button1.frame), CGRectGetMaxY(self.button1.frame), self.view.bounds.size.width, self.view.bounds.size.height - 44 - self.button1.bounds.size.height) style:UITableViewStyleGrouped];
        self.table1.backgroundColor = [UIColor greenColor];

        self.table1.tag = 1;
        
        self.table1.delegate = self;
        self.table1.dataSource = self;
        
        [self.view addSubview:self.table1];
    }
    self.table1.hidden = NO;
    self.table2.hidden = YES;
    
}

- (void)button2Action
{
    if (self.table2 == nil) {
        self.table2 = [[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.button1.frame), CGRectGetMaxY(self.button2.frame), self.view.bounds.size.width, self.view.bounds.size.height - 44 - self.button2.bounds.size.height) style:(UITableViewStyleGrouped)];
        self.table2.backgroundColor = [UIColor yellowColor];
        
        self.table2.tag = 2;
        
        
        self.table2.delegate = self;
        self.table2.dataSource =self;
        
        [self.view addSubview:self.table2];
    }
    self.table1.hidden = YES;
    self.table2.hidden = NO;
    
}



#pragma mark tableview代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 1) {
        return 1;
    }else{
        return 2;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return 10;
    }else{
        return 5;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    NSLog(@"tag%ld",(long)self.table2.tag);
    
    
    NSLog(@"11111tag%ld",(long)self.table1.tag);
    
    
    if (tableView.tag == 1) {
        
        // 重用标识符
        static NSString *cell_id = @"cell_1";
        
        // 先从重用池找cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
        
        // 判断是否找到cell
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cell_id];
        }
        
        
        // cell设置属性
        // 给cell赋值
        // 文本
        cell.textLabel.text = [NSString stringWithFormat:@"section: %ld  row: %ld",indexPath.section,indexPath.row];
        
        
        // 子标题
        cell.detailTextLabel.text = @"测试数据11";
        
        // 选中样式
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        
        // 附加信息
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        //    cell.accessoryView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        
        cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
        
        return cell;
    }else{
        // 重用标识符
        static NSString *cell_id = @"cell_2";
        
        // 先从重用池找cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
        
        // 判断是否找到cell
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cell_id];
        }
        
        
        // cell设置属性
        // 给cell赋值
        // 文本
        cell.textLabel.text = [NSString stringWithFormat:@"section: %ld  row: %ld",indexPath.section,indexPath.row];
        
        
        // 子标题
        cell.detailTextLabel.text = @"测试数据22";
        
        // 选中样式
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        
        // 附加信息
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        //    cell.accessoryView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        
        cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
        
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
