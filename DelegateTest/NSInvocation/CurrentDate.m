//
//  CurrentDate.m
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "CurrentDate.h"

@implementation CurrentDate

-(NSString *)stringForDate:(NSDate *)date usingFormatter:(NSDateFormatter *)formatter {
    return [formatter stringFromDate:date];
}

@end
