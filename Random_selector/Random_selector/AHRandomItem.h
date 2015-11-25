//
//  AHRandomItem.h
//  Random_selector
//
//  Created by Axel Han on 15/11/24.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AHRandomItem : NSObject

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) IBOutlet UIButton *button;

- (instancetype)initWithName:(NSString *)theName;
- (void)setButtonWithCGRect:(CGRect)rect;

@end
