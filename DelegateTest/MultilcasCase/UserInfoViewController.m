//
//  UserInfoViewController.m
//  DelegateTest
//
//  Created by wq on 2017/12/16.
//  Copyright © 2017年 mikey. All rights reserved.
//
//设置代理传值，只需要在 改动确定（如个人信息修改） 之前的VC（在同一栈内）遵守协议，这样代理才有意义；不在同一个栈的VC，或许已经销毁，遵守代理并无作用，在viewWillAppear:中访问全局个人信息类UserInfo即可。 总之，遵守代理的类在发通知之前不能销毁。
#import "UserInfoViewController.h"

@interface UserInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *ageTf;

@end

@implementation UserInfoViewController
- (IBAction)suremodify:(id)sender {
    UserInfo *userI = [UserInfo sharedManager];
    userI.name = self.nameTf.text;
    userI.age = self.ageTf.text;
    [userI sendMsgWhenUserInfoChanged];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
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
