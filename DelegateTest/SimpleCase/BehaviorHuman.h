//
//  BehaviorHuman.h
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "Behavior.h"
@protocol BehaviorHumanDelegate <BehaviorDelegate>

- (void)speak;

@end

@interface BehaviorHuman : Behavior

@property (nonatomic, weak) id<BehaviorHumanDelegate> delegateHuman;

@end
