//
//  BaseAddNotification.m
//  DelegateTest
//
//  Created by wq on 2017/12/8.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "BaseAddNotification.h"

@implementation BaseAddNotification

-(BOOL)isMainThread {
    return [super isMainThread];
}

-(void)sendNotificatonWithStr:(NSString *)str {
    dispatch_queue_t queue;
    if (![self isMainThread]) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }else {
        queue = dispatch_get_main_queue();
    }
    //[_theLock lock];
    for (id<BaseNotificationDelegate> classs in self.listset) {
        dispatch_async(queue, ^{
            if ([classs respondsToSelector:@selector(receiveDidMsg:)]) {
                [classs receiveDidMsg:str];
            }
        });
    }
    //[_theLock unlock];
}

@end
