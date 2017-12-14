//
//  MultipleNotificationNode.m
//  DelegateTest
//
//  Created by wq on 2017/12/14.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "MultipleNotificationNode.h"

@interface MultipleNotificationNode ()
{
#if __has_feature(objc_arc_weak)
    __weak id delegate;
#else
    __unsafe_unretained id delegate;
#endif
    
    dispatch_queue_t delegateQueue;
}
@end

@implementation MultipleNotificationNode

@synthesize delegate;
@synthesize delegateQueue;

-(instancetype)initWithDelegate:(id)inDelegate delegateQueue:(dispatch_queue_t)inDelegateQueue {
    if (self = [super init]) {
        delegate = inDelegate;
        delegateQueue = inDelegateQueue;
        
#if !OS_OBJECT_USE_OBJC
        if (delegateQueue)
            dispatch_retain(delegateQueue);
#endif
    }
    return self;
}
-(void)dealloc {
#if !OS_OBJECT_USE_OBJC
    if (delegateQueue)
        dispatch_release(delegateQueue);
#endif
}
@end
