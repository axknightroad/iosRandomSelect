//
//  AHTableViewController.m
//  Random_selector
//
//  Created by Axel Han on 16/1/18.
//  Copyright © 2016年 Axel Han. All rights reserved.
//

#import "AHTableViewController.h"
#import "AHRandomArray.h"

#define kdefultHeight 40
#define kdefultWeight 335
#define kdefultX 20
#define kdefultY 176

@interface AHTableViewController () <UIAlertViewDelegate>

@property (nonatomic) NSInteger selectIndex;

@end

@implementation AHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [AHRandomArray sharedItems].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [AHRandomArray sharedItems].dataArray[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndex = indexPath.row;
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    //创建弹出窗口
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"移除候选项"
                                                 message:[AHRandomArray sharedItems].dataArray[indexPath.row]
                                                delegate:self
                                       cancelButtonTitle:@"取消"
                                       otherButtonTitles:@"确定", nil];
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
        [[AHRandomArray sharedItems] removeAtIndex:self.selectIndex];
        [self reload];
    }
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"候选项列表";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - 代理方法
#pragma mark 设置标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kdefultHeight;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kdefultHeight;
}


- (void)reload {
    NSInteger lineNum = MIN([AHRandomArray sharedItems].count, 9);
    if (!lineNum) lineNum--;
    self.tableView.frame = CGRectMake(kdefultX,
                                      kdefultY,
                                      kdefultWeight,
                                      kdefultHeight * (lineNum + 1));
    [self.tableView reloadData];
    
}

@end
