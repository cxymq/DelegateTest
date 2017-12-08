//
//  BehaviorHuman.m
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "BehaviorHuman.h"

@implementation BehaviorHuman

-(void)whenWillAngry {
    NSLog(@"BehaviorHuman whenWillAngry");
    if ([self.delegateHuman respondsToSelector:@selector(speak)]) {
        [self.delegateHuman speak];
    }
}

@end
