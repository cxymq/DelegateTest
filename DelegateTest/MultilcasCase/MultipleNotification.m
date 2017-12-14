//
//  MultipleNotification.m
//  DelegateTest
//
//  Created by wq on 2017/12/8.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "MultipleNotification.h"
#import "MultipleNotificationNode.h"

@interface MultipleNotification ()
{
    NSMutableArray *delegates;
}
- (NSInvocation *)duplicateInvocation:(NSInvocation *)origInvocation;
@end

@implementation MultipleNotification

-(instancetype)init {
    if (self == [super init]) {
        delegates = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addDelegate:(id)delegate {
    [self addDelegate:delegate delegateQueue:dispatch_get_main_queue()];
}
- (void)removeDelegate:(id)delegate {
    [self removeDelegate:delegate delegateQueue:NULL];
}

-(void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue {
    if (delegate == nil)  return;
    if (delegateQueue == NULL)  return;
    
    MultipleNotificationNode *node = [[MultipleNotificationNode alloc]initWithDelegate:delegate delegateQueue:delegateQueue];
    [delegates addObject:node];
}

-(void)removeDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue {
    if (delegate  == nil) return;
    
    NSUInteger i;
    for (i = [delegates count]; i > 0; i--) {
        MultipleNotificationNode *node = delegates[i-1];
        id nodeDelegate = node.delegate;
        
        if (delegate == nodeDelegate) {
            if ((delegateQueue == NULL) || (delegateQueue == node.delegateQueue)) {
                node.delegate = nil;
                [delegates removeObjectAtIndex:(i-1)];
            }
        }
    }
}

-(void)removeAllDelegates {
    for (MultipleNotificationNode *node in delegates) {
        node.delegate = nil;
    }
    [delegates removeAllObjects];
}
-(void)dealloc {
    [self removeAllDelegates];
}

-(NSInvocation *)duplicateInvocation:(NSInvocation *)origInvocation {
    NSMethodSignature *signature = [origInvocation methodSignature];
    NSInvocation *dupInvocation = [NSInvocation invocationWithMethodSignature:signature];
    [dupInvocation setSelector:[origInvocation selector]];
    
    NSUInteger i, count = [signature numberOfArguments];
    for (i = 2; i < count; i ++) {
        const char *type = [signature getArgumentTypeAtIndex:i];
        if (*type == *@encode(BOOL)) {
            BOOL value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == *@encode(char) || *type == *@encode(unsigned char))
        {
            char value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == *@encode(short) || *type == *@encode(unsigned short))
        {
            short value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == *@encode(int) || *type == *@encode(unsigned int))
        {
            int value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == *@encode(long) || *type == *@encode(unsigned long))
        {
            long value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == *@encode(long long) || *type == *@encode(unsigned long long))
        {
            long long value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == *@encode(double))
        {
            double value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == *@encode(float))
        {
            float value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == '@')
        {
            void *value;
            [origInvocation getArgument:&value atIndex:i];
            [dupInvocation setArgument:&value atIndex:i];
        }
        else if (*type == '^')
        {
            void *block;
            [origInvocation getArgument:&block atIndex:i];
            [dupInvocation setArgument:&block atIndex:i];
        }
        else {
            NSString *selectorStr = NSStringFromSelector([origInvocation selector]);
            NSString *format = @"Argument %lu to method %@ - Type(%c) not supported";
            NSString *reason = [NSString stringWithFormat:format,(unsigned long)(i-2),selectorStr,*type];
            
            [[NSException exceptionWithName:NSInvalidArgumentException reason:reason userInfo:nil] raise];
        }
    }
    [dupInvocation retainArguments];
    return dupInvocation;
}


@end
