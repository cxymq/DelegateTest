//
//  BaseNotification.h
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseNotificationDelegate <NSObject>

- (void)receiveDidMsg:(NSString *)msg;

@end

@interface BaseNotification : NSObject

@property (nonatomic, strong) NSMutableSet<BaseNotificationDelegate> *listset;

- (void)addObserverClass:(id)classs;
- (void)removeObserverClass:(id)classs;

- (BOOL)isMainThread;

- (void)sendNotificatonWithStr:(NSString *)str;

@end
