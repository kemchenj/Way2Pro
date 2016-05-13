//
//  ViewController.m
//  Contact
//
//  Created by kemchenj on 5/9/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "STContactViewController.h"



@interface STLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton    *loginButton;
@property (weak, nonatomic) IBOutlet UISwitch    *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UISwitch    *rememberPasswordSwitch;

@end



@implementation STLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setup];
}

- (void)setup
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    self.accountField.text         = [userDefaults valueForKey:@"AccountName"];
    self.autoLoginSwitch.on        = [userDefaults boolForKey:@"IsAutoLogin"];
    self.rememberPasswordSwitch.on = [userDefaults boolForKey:@"IsRememberPassword"];

    if (self.rememberPasswordSwitch.isOn) {
        self.passwordField.text = [userDefaults valueForKey:@"Password"];
        if (self.autoLoginSwitch.isOn) {
            [self loginButtonClick];
        }
    }

    [self.accountField addTarget:self
                          action:@selector(textChange)
                forControlEvents:UIControlEventEditingChanged
    ];

    [self.passwordField addTarget:self
                           action:@selector(textChange)
                 forControlEvents:UIControlEventEditingChanged
    ];

    [self.autoLoginSwitch addTarget:self
                             action:@selector(isRememberPassword)
                   forControlEvents:UIControlEventValueChanged
    ];

    [self.rememberPasswordSwitch addTarget:self
                                    action:@selector(isAutoLogin)
                          forControlEvents:UIControlEventValueChanged
    ];

    [self textChange];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];

    STContactViewController *contactViewController = segue.destinationViewController;
    contactViewController.accountName = self.accountField.text;

    if (!self.rememberPasswordSwitch.isOn) {
        self.passwordField.text = @"";
    }
}



#pragma mark - <InputField Thing>

- (void)textChange
{
    self.loginButton.enabled = _accountField.text.length && _passwordField.text.length;
}

- (void)isAutoLogin
{
    if (!self.rememberPasswordSwitch.isOn) {
        [self.autoLoginSwitch setOn:NO
                           animated:YES
        ];
    }
}

- (void)isRememberPassword
{
    if (self.autoLoginSwitch.isOn) {
        [self.rememberPasswordSwitch setOn:YES
                                  animated:YES
        ];
    }
}

- (IBAction)loginButtonClick
{
    [MBProgressHUD showMessage:@"正在努力登录中..." toView:self.view];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view];
        if ([self.accountField.text isEqualToString:@"kem"] && [self.passwordField.text isEqualToString:@"awsedrf"]) {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

            [userDefaults setObject:self.accountField.text
                             forKey:@"AccountName"
            ];

            [userDefaults setObject:self.passwordField.text
                             forKey:@"Password"
            ];

            [userDefaults setBool:self.autoLoginSwitch.isOn
                           forKey:@"IsAutoLogin"
            ];

            [userDefaults setBool:self.rememberPasswordSwitch.isOn
                           forKey:@"IsRememberPassword"
            ];

            [self performSegueWithIdentifier:@"contact"
                                      sender:nil
            ];
        } else {
            [MBProgressHUD hideHUDForView:self.view];
            [MBProgressHUD showError:@"用户名或密码"];
        }
    });
}

@end