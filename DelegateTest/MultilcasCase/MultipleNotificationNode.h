//
//  MultipleNotificationNode.h
//  DelegateTest
//
//  Created by wq on 2017/12/14.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MultipleNotificationNode : NSObject

-(instancetype)initWithDelegate:(id)inDelegate delegateQueue:(dispatch_queue_t)inDelegateQueue;

#if __has_feature(objc_arc_weak)
@property (readwrite, weak) id delegate;
#else
@property (readwrite, __unsafe_unretained) id delegate;
#endif

@property (nonatomic, readonly) dispatch_queue_t delegateQueue;

@end
