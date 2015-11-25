//
//  ViewController.h
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHRandomArray.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) AHRandomArray *myRandomArray;
@property (strong, nonatomic) IBOutlet UITextField *textfiled;

- (IBAction)add:(id)sender;
- (IBAction)remove:(id)sender;
- (IBAction)clear;
- (IBAction)generator;

- (IBAction)textFiledReturnEditing:(id)sender;


@end

