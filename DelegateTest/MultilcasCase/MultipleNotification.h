//
//  MultipleNotification.h
//  DelegateTest
//
//  Created by wq on 2017/12/8.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MultipleNotification : NSObject

- (void)addDelegate:(id)delegate;
- (void)removeDelegate:(id)delegate;
- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;
- (void)removeDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

- (void)removeAllDelegates;

@end
