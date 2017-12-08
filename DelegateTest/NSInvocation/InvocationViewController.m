//
//  InvocationViewController.m
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "InvocationViewController.h"
#import "CurrentDate.h"

@interface InvocationViewController ()
{
    CurrentDate *_currentDateClass;
}

@end

@implementation InvocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _currentDateClass = [[CurrentDate alloc]init];
    
    [self originCall];
    [self invocationCall];
    
    [self performSelector:@selector(performCall:) withObject:@{@"id":@"123"}];
}
- (void)performCall:(id)per {
    NSDictionary *dic = (NSDictionary *)per;
    NSLog(@"Perform call;key:%@,value:%@",dic.allKeys.firstObject,dic.allValues.firstObject);
}
- (void)originCall {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"d M Y"];
    
    NSString *currentdate = [_currentDateClass stringForDate:[NSDate date] usingFormatter:dateFormat];
    
    NSLog(@"Origin %@",currentdate);
}
- (void)invocationCall {
    //方法签名，需要被调用消息所属的类CurrentDate，被调用的消息selector
    SEL selector = @selector(stringForDate:usingFormatter:);
    NSMethodSignature *sign = [[_currentDateClass class]instanceMethodSignatureForSelector:selector];
    
    //根据签名创建Invocation,设置调用者的对象以及消息
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sign];
    [invocation setTarget:_currentDateClass];
    [invocation setSelector:selector];
    
    //传入参数，下标需要从2开始
    NSDate *date = [NSDate date];
    [invocation setArgument:&date atIndex:2];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateStyle:NSDateFormatterMediumStyle];
    [invocation setArgument:&dateFormat atIndex:3];
    
    //__unsafe_unretained。而我们在定义result时使用的是__strong类型的指针对象，arc就会假设该内存块已被retain（实际没有），当result出了定义域释放时，导致该crash。假如在定义之前有赋值的话，还会造成内存泄露的问题。
    __unsafe_unretained NSString *result = nil;
    //retain所有参数，防止被释放
    [invocation retainArguments];
    //消息调用
    [invocation invoke];
    //将返回值赋值给变量
    [invocation getReturnValue:&result];
    NSLog(@"Invocation %@",result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
