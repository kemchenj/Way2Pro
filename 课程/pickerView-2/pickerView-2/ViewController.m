//
//  ViewController.m
//  pickerView-2
//
//  Created by kemchenj on 5/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cityTextField.delegate     = self;
    self.countryTextField.delegate  = self;
    self.birthdayTextField.delegate = self;
    
}



#pragma mark - <UITextField Delegate>

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

@end
