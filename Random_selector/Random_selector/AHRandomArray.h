//
//  AHRandom.h
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AHRandomItem.h"

#define kdefultHeight 40
#define kdefultWeight 335
#define kdefultX 20
#define kdefultY 136

@interface AHRandomArray : NSObject

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (nonatomic) CGRect rect;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UITableView *dataTable;


- (void)add:(AHRandomItem *)object;
- (NSUInteger)remove:(AHRandomItem *)object;
- (void)generator;
- (void)clear;

@end
