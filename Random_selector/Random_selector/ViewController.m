//
//  ViewController.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myRandomArray, textfiled;


- (void)add:(id)sender {
    
}

-(IBAction)textFiledReturnEditing:(id)sender {
    AHRandomItem *item = [[AHRandomItem alloc] initWithName:[textfiled text]];
    [myRandomArray add:item];
    //[self.view addSubview:item.button];
    [self.view addSubview:myRandomArray.dataTable];
    textfiled.text = nil;
    [sender resignFirstResponder];
}

- (IBAction)generator {
//    NSMutableString *result = [NSMutableString stringWithString:@"随机选择的结果为："];
//   [result appendString:[myRandomArray generator]];
//   UILabel *laber = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 335, 30)];
    [myRandomArray generator];
    [self.view addSubview:myRandomArray.resultLabel];
}

- (IBAction)clear {
    [myRandomArray clear];
    [myRandomArray.resultLabel removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myRandomArray = [[AHRandomArray alloc] init];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
