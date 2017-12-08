//
//  BaseAddNotification.h
//  DelegateTest
//
//  Created by wq on 2017/12/8.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "BaseNotification.h"

@protocol BaseAddNotificationDelegate <NSObject>

- (void)receiveWillAdd:(NSString *)add;

@end

@interface BaseAddNotification : BaseNotification



@end
