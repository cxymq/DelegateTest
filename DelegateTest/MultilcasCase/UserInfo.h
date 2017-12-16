//
//  UserInfo.h
//  DelegateTest
//
//  Created by wq on 2017/12/15.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserInfoDelegate <NSObject>

- (void)sendMsgWithUserInfo:(NSDictionary *)userInfo;

@end

@interface UserInfo : MultipleNotification

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;

+ (UserInfo *)sharedManager;

- (void)sendMsgWhenUserInfoChanged;

@end
