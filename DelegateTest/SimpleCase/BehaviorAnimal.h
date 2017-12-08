//
//  BehaviorAnimal.h
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "Behavior.h"

@protocol BehaviorAnimalDelegate <BehaviorDelegate>

- (void)mania;

@end

@interface BehaviorAnimal : Behavior

@property (nonatomic, weak) id<BehaviorAnimalDelegate> delegateAnimal;

@end
