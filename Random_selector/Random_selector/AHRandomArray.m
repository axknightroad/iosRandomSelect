//
//  AHRandom.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "AHRandomArray.h"

@interface AHRandomArray ()

@property (nonatomic, copy) NSMutableArray *privateItems;

@end


@implementation AHRandomArray

@synthesize privateItems = _privateItems;

#pragma mark init

+ (instancetype)sharedItems {
    static AHRandomArray *sharedItems = nil;
    
    if (!sharedItems) {
        sharedItems = [[self alloc] initPriviate];
    }
    
    return sharedItems;
}

- (instancetype)initPriviate {
    self = [super init];
    if (self) {
        _privateItems = [NSMutableArray array];
    }
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[AHRandomArray sharedItems]" userInfo:nil];
}

#pragma get dataArray
- (NSArray *)dataArray {
    return self.privateItems;
}

#pragma mark add candidate item
- (void)add:(NSString *)object {
    [self.privateItems addObject:object];
}

#pragma mark remove candidate item
- (void)removeAtIndex:(NSInteger)index {
    [self.privateItems removeObjectAtIndex:index];
}

#pragma mark generator random reslut
- (NSString *)generator {
    NSMutableString *resultString;
    int arrayCount = (unsigned) [self.privateItems count];
    if (arrayCount) {
        resultString = [NSMutableString stringWithString:@"随机选择的结果为："];
        NSString *result = self.privateItems[arc4random() % arrayCount];
        [resultString appendString:result];
    } else {
        resultString = [NSMutableString stringWithString:@"没有候选项"];
    }
    return resultString;
}

#pragma mark clear candidate array
- (void)clear {
    [self.privateItems removeAllObjects];
}

- (NSUInteger)count {
    return [self.privateItems count];
}

- (NSString *)dataAtInedx:(NSUInteger)index {
    return self.privateItems[index];
}

@end
