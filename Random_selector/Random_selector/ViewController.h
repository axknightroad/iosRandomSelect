//
//  ViewController.h
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHRandomArray.h"

#define kdefultHeight 40
#define kdefultWeight 335
#define kdefultX 20
#define kdefultY 176

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) AHRandomArray *myRandomArray;
@property (strong, nonatomic) IBOutlet UITextField *textfiled;
@property (strong, nonatomic) IBOutlet UITableView *dataTable;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) CGRect rect;


- (IBAction)clear;
- (IBAction)generator;

- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)viewTouchDown:(id)sender;


@end

