//
//  Behavior.m
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "Behavior.h"

@implementation Behavior

- (void)whenWillHungry {
    NSLog(@"Behavior whenWillHungry");
    if ([self.delegate respondsToSelector:@selector(eatFood)]) {
        [self.delegate eatFood];
    }
}
- (void)whenWillAngry {
    NSLog(@"Behavior whenWillAngry");
}

@end
