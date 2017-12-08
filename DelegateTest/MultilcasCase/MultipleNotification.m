//
//  MultipleNotification.m
//  DelegateTest
//
//  Created by wq on 2017/12/8.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "MultipleNotification.h"

@interface MultipleNotification ()
{
    NSMutableArray *delegates;
}

@end

@implementation MultipleNotification

-(instancetype)init {
    if (self == [super init]) {
        delegates = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addDelegate:(id)delegate {
    [self addDelegate:<#(id)#> delegateQueue:<#(dispatch_queue_t)#>];
}
- (void)removeDelegate:(id)delegate {
    
}

-(void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue {
    
}

-(void)removeDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue {
    
}

-(void)removeAllDelegates {
    
}


@end
