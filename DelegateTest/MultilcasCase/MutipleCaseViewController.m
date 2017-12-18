//
//  MutipleCaseViewController.m
//  DelegateTest
//
//  Created by wq on 2017/12/15.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "MutipleCaseViewController.h"

@interface MutipleCaseViewController ()
{
    UserInfo *userInfo;
}
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *ageLb;

@end

@implementation MutipleCaseViewController
- (IBAction)modifyUserInfo:(id)sender {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
-(void)dealloc {
    [userInfo removeDelegate:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    userInfo = [UserInfo sharedManager];
    [userInfo addDelegate:self];
    
}
-(void)sendMsgWithUserInfo:(NSDictionary *)userInfo {
    NSLog(@"name:%@;pwd:%@",userInfo[@"userName"],userInfo[@"userAge"]);
    self.nameLb.text = userInfo[@"userName"];
    self.ageLb.text = userInfo[@"userAge"];
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
