//
//  AHRandom.h
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AHRandomArray : NSObject

@property (readonly, nonatomic) NSArray *dataArray;

+ (instancetype)sharedItems;

- (void)add:(NSString *)object;
- (void)removeAtIndex:(NSInteger)index;
- (NSString *)generator;
- (void)clear;

- (NSUInteger)count;
- (NSString *)dataAtInedx:(NSUInteger)index;

@end
