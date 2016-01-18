//
//  ViewController.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "ViewController.h"
#import "AHRandomArray.h"
#import "AHTableViewController.h"

#define kdefultHeight 40
#define kdefultWeight 335
#define kdefultX 20
#define kdefultY 176

@interface ViewController () {
    NSString *selectItem;
}

@property (strong, nonatomic) IBOutlet UITextField *textfiled;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property AHTableViewController *tvc;

- (IBAction)clear;
- (IBAction)generator;

- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)viewTouchDown:(id)sender;

@end

@implementation ViewController

@synthesize textfiled = _textfiled, resultLabel = _resultLabel, tvc = _tvc;

#pragma mark - init and some method created by Xcode
- (void)viewDidLoad {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    _tvc = [[AHTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [_tvc reload];
    [self.view addSubview:_tvc.tableView];
    // Do any additional setup after loading the view, typically from a nib.
    //dataTable = [[UITableView alloc]initWithFrame:self.rect
    //                                        style:UITableViewStylePlain];
    //dataTable.dataSource = self;
    //dataTable.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - methods to process random array
#pragma mark return when press return button
-(IBAction)textFiledReturnEditing:(id)sender {
    NSString *item = [self.textfiled text];
    [[AHRandomArray sharedItems] add:item];
    [self.tvc reload];
    self.textfiled.text = nil;
    self.resultLabel.text = nil;
    [sender resignFirstResponder];
}

#pragma mark touch down to resign keyboard
- (IBAction)viewTouchDown:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark generate result when press generator button
- (IBAction)generator {
    self.resultLabel.text = [[AHRandomArray sharedItems] generator];
}

#pragma mark clear table, array and result when press clear button
- (IBAction)clear {
    [[AHRandomArray sharedItems] clear];
    self.resultLabel.text = nil;
    [self.tvc reload];
}


#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden {
    return NO;
}

@end
