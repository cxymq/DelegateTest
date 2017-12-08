//
//  SimpleViewController.m
//  DelegateTest
//
//  Created by wq on 2017/12/7.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "SimpleViewController.h"

@interface SimpleViewController ()<BehaviorDelegate,BehaviorHumanDelegate,BehaviorAnimalDelegate>

@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //遵守多个协议，类似tableview
    [self simpleTest];
}
- (void)simpleTest {
    //    Behavior *behavior = [[Behavior alloc]init];
    //    behavior.delegate = self;
    //    [behavior whenWillHungry];
    
    BehaviorHuman *human = [[BehaviorHuman alloc]init];
    human.delegateHuman = self;
    [human whenWillAngry];
    human.delegate = self;
    [human whenWillHungry];
    
    //    BehaviorAnimal *animal = [[BehaviorAnimal alloc]init];
    //    animal.delegateAnimal = self;
    //    [animal whenWillAngry];
}
#pragma mark -- BehaviorDelegate
-(void)eatFood {
    NSLog(@"SimpleVC eat food");
}

#pragma mark -- BehaviorHumanDelegate
- (void)speak {
    NSLog(@"SimpleVC Speak");
}

#pragma mark -- BehaviorAnimalDelegate
-(void)mania {
    NSLog(@"SimpleVC Mania");
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
