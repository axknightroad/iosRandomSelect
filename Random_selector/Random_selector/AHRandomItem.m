//
//  AHRandomItem.m
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "AHRandomItem.h"

@implementation AHRandomItem

@synthesize name, button;

- (instancetype)initWithName:(NSString *)theName
{
    self = [super init];
    if (self) {
        name = theName;
        button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:theName forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorWithRed:(double)223/255
                                                 green:(double)223/255
                                                  blue:(double)223/255
                                                 alpha:1];
        
        
    }
    return self;
}

- (void)setButtonWithCGRect:(CGRect)rect {
    button.frame = rect;
}

@end
