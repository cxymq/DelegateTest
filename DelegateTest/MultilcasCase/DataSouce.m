//
//  DataSouce.m
//  DelegateTest
//
//  Created by wq on 2017/12/15.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "DataSouce.h"

@implementation DataSouce

+ (DataSouce *)sharedManager
{
    static DataSouce *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

@end
