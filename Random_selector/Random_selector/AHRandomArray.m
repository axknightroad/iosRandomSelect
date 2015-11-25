//
//  AHRandom.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "AHRandomArray.h"

@implementation AHRandomArray

@synthesize dataArray, rect, resultLabel, dataTable;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
        self.rect = CGRectMake(kdefultX, kdefultY, kdefultWeight, kdefultHeight);
        self.resultLabel = [[UILabel alloc]
                            initWithFrame:CGRectMake(kdefultX,
                                                     kdefultY - 35,
                                                     kdefultWeight,
                                                     kdefultHeight)];
        dataTable = [[UITableView alloc]initWithFrame:self.rect
                                                style:UITableViewStylePlain];
        self.dataTable.dataSource = self;
    }
    return self;
}

- (void)add:(AHRandomItem *)object {
    [object setButtonWithCGRect:rect];
    [self.dataArray addObject:object];
    if (rect.size.height <= 400) {
        rect.size.height += kdefultHeight;
        dataTable.frame = rect;
    }
    [dataTable reloadData];
//    rect.origin.y += 35;
}

- (NSUInteger)remove:(AHRandomItem *)object {
    NSUInteger index = [self.dataArray indexOfObject:object];
    if (index != NSNotFound) {
        [self.dataArray removeObject:object];
//        rect.origin.y = kdefultHeight + 35 * index;
        for (NSUInteger i = index; i < [dataArray count]; i++) {
            [dataArray[i] setButtonWithCGRect:rect];
//            rect.origin.y += 35;
        }
    }
    return index;
}

- (void)generator {
    NSMutableString *resultString;
    int arrayCount = (unsigned) [dataArray count];
    if (arrayCount) {
        resultString = [NSMutableString stringWithString:@"随机选择的结果为："];
        AHRandomItem *result = dataArray[arc4random_uniform(arrayCount )];
        [resultString appendString:result.name];
    } else {
        resultString = [NSMutableString stringWithString:@"没有候选项"];
    }
    resultLabel.text = resultString;
}

- (void)clear{
    [dataArray removeAllObjects];
//    rect.origin.y = kdefultY;
    rect.size.height = kdefultHeight;
    dataTable.frame = rect;
    [dataTable reloadData];
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSIndexPath是一个结构体，记录了组和行信息
    AHRandomItem *item = dataArray[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = item.name;
    return cell;
}

#pragma mark 返回行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kdefultHeight - 5;
}

@end
