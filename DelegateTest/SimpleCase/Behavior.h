//
//  Behavior.h
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BehaviorDelegate <NSObject>

- (void)eatFood;

@end

@interface Behavior : NSObject

@property (nonatomic, weak) id<BehaviorDelegate> delegate;

- (void)whenWillHungry;

- (void)whenWillAngry;

@end
