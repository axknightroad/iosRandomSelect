//
//  AHRandom.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "AHRandomArray.h"

@implementation AHRandomArray

@synthesize dataArray;

#pragma mark init
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark add candidate item
- (void)add:(NSString *)object {
    [self.dataArray addObject:object];
}

#pragma mark remove candidate item
- (void)remove:(NSString *)object {
    [self.dataArray removeObject:object];
}

#pragma mark generator random reslut
- (NSString *)generator {
    NSMutableString *resultString;
    int arrayCount = (unsigned) [dataArray count];
    if (arrayCount) {
        resultString = [NSMutableString stringWithString:@"随机选择的结果为："];
        NSString *result = dataArray[arc4random_uniform(arrayCount )];
        [resultString appendString:result];
    } else {
        resultString = [NSMutableString stringWithString:@"没有候选项"];
    }
    return resultString;
}

#pragma mark clear candidate array
- (void)clear{
    [dataArray removeAllObjects];
}

- (NSUInteger)count {
    return [dataArray count];
}

- (NSString *)dataAtInedx:(NSUInteger)index {
    return dataArray[index];
}

@end
