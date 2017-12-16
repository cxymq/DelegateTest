//
//  UserInfo.m
//  DelegateTest
//
//  Created by wq on 2017/12/15.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (UserInfo *)sharedManager
{
    static UserInfo *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}
-(instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)sendMsgWhenUserInfoChanged {
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:self.name,@"userName",self.age,@"userAge", nil];
    [(UserInfo<UserInfoDelegate> *)self sendMsgWithUserInfo:dic];
}


@end
