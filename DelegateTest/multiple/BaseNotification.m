//
//  BaseNotification.m
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "BaseNotification.h"

@interface BaseNotification()

@property (nonatomic ,strong)NSLock *theLock;

@end

@implementation BaseNotification

-(instancetype)init {
    if (self = [super init]) {
        _listset = [[NSMutableSet<BaseNotificationDelegate> alloc]init];
        _theLock = [[NSLock alloc]init];
    }
    return self;
}

-(void)addObserverClass:(id<BaseNotificationDelegate>)classs {
    [_theLock lock];
    if (classs != nil) {
        [_listset addObject:classs];
    }
    [_theLock unlock];
}

- (void)removeObserverClass:(id<BaseNotificationDelegate>)classs {
    [_theLock lock];
    if (classs != nil) {
        [_listset removeObject:classs];
    }
    [_theLock unlock];
}

- (BOOL)isMainThread {
    return TRUE;
}
- (void)sendNotificatonWithStr:(NSString *)str {
    dispatch_queue_t queue;
    if (![self isMainThread]) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }else {
        queue = dispatch_get_main_queue();
    }
    [_theLock lock];
    for (id<BaseNotificationDelegate> classs in _listset) {
        dispatch_async(queue, ^{
            if ([classs respondsToSelector:@selector(receiveDidMsg:)]) {
                [classs receiveDidMsg:str];
            }
        });
    }
    [_theLock unlock];
}

@end
