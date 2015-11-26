//
//  ViewController.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *selectItem;
}

@end

@implementation ViewController

@synthesize myRandomArray, rect, textfiled, dataTable, resultLabel;

#pragma mark - methods to process random array
#pragma mark return when press return button
-(IBAction)textFiledReturnEditing:(id)sender {
    NSString *item = [textfiled text];
    [myRandomArray add:item];
    if (rect.size.height <= 360) {
        rect.size.height += kdefultHeight;
        dataTable.frame = rect;
    }
    [dataTable reloadData];
    [self.view addSubview:dataTable];
    textfiled.text = nil;
    resultLabel.text = nil;
    [sender resignFirstResponder];
}

#pragma mark touch down to resign keyboard
- (IBAction)viewTouchDown:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark generate result when press generator button
- (IBAction)generator {
    resultLabel.text = [myRandomArray generator];
    [self.view addSubview:resultLabel];
}

#pragma mark clear table, array and result when press clear button
- (IBAction)clear {
    [myRandomArray clear];
    [resultLabel removeFromSuperview];
    rect.size.height = kdefultHeight;
    dataTable.frame = rect;
    [dataTable reloadData];
    [dataTable removeFromSuperview];
    resultLabel.text = nil;
}

#pragma mark - init and some method created by Xcode
- (void)viewDidLoad {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view, typically from a nib.
    myRandomArray = [[AHRandomArray alloc] init];
    rect = CGRectMake(kdefultX, kdefultY, kdefultWeight, kdefultHeight);
    dataTable = [[UITableView alloc]initWithFrame:self.rect
                                            style:UITableViewStylePlain];
    dataTable.dataSource = self;
    dataTable.delegate = self;
    resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(kdefultX,
                                                            kdefultY - 35,
                                                            kdefultWeight,
                                                            kdefultHeight)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [myRandomArray count];
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSIndexPath是一个结构体，记录了组和行信息
    NSString *item = [myRandomArray dataAtInedx:indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = item;
    return cell;
}


#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"候选项列表";
}

#pragma mark - 代理方法
#pragma mark 设置标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kdefultHeight;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kdefultHeight;
}

#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectItem = [myRandomArray dataAtInedx:indexPath.row];
    //创建弹出窗口
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"移除候选项" message:selectItem delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    alert.alertViewStyle = UIAlertViewStylePlainTextInput; //设置窗口内容样式
//    UITextField *textField = [alert textFieldAtIndex:0]; //取得文本框
//    textField.text = select; //设置文本框内容
    [alert show]; //显示窗口
}

#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //当点击了第二个按钮（OK）
    if (buttonIndex==1) {
        //删除数据
        [myRandomArray remove:selectItem];
        if ([myRandomArray count] <= 8) {
            rect.size.height -= kdefultHeight;
            dataTable.frame = rect;
        }
        if (![myRandomArray count]) {
            [dataTable removeFromSuperview];
        }
        //刷新表格
        [dataTable reloadData];
    }
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden {
    return NO;
}

@end
