//
//  CurrentDate.h
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentDate : NSObject

- (NSString *)stringForDate:(NSDate *)date usingFormatter:(NSDateFormatter *)formatter;

@end
