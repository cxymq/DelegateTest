//
//  BehaviorAnimal.m
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "BehaviorAnimal.h"

@implementation BehaviorAnimal

- (void)whenWillAngry {
    NSLog(@"BehaviorAnimal whenWillAngry");
    if ([self.delegateAnimal respondsToSelector:@selector(mania)]) {
        [self.delegateAnimal mania];
    }
}

@end
