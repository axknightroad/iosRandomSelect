//
//  AHRandom.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "AHRandom.h"

@implementation AHRandom

@synthesize dataArray;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)add:(NSString *)object {
    [self.dataArray addObject:object];
}

- (void)remove:(NSString *)object {
    [self.dataArray removeObject:object];
}

- (NSString *)generator {
    int arrayCount = (unsigned) [dataArray count];
    if (arrayCount) {
        NSString *result = dataArray[arc4random_uniform(arrayCount )];
        return result;
    } else {
        return @"no object";
    }
}

- (void)clear{
    [dataArray removeAllObjects];
}

@end
