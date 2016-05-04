//
//  ViewController.m
//  text
//
//  Created by kemchenj on 5/1/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
//#import "STToolBar.h"



@interface ViewController ()<UITextFieldDelegate>

@property(weak, nonatomic) IBOutlet UITextField *nameField;
@property(weak, nonatomic) IBOutlet UITextField *phoneField;
@property(weak, nonatomic) IBOutlet UITextField *addressField;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //UIView *temp = [[UIView alloc] init];
    //temp.frame               = CGRectMake(0, 0, 0, 300);
    //temp.backgroundColor     = [UIColor redColor];
    //self.nameField.inputView = temp;
    //
    //self.nameField.inputAccessoryView    = [UIButton buttonWithType:UIButtonTypeContactAdd];
    //self.phoneField.inputAccessoryView   = [[UISwitch alloc] init];
    //self.addressField.inputAccessoryView = [[UISegmentedControl alloc] initWithItems:@[@"1", @"2"]];
    //
    //STToolBar *toolBar = [[[NSBundle mainBundle] loadNibNamed:@"STToolBar" owner:nil options:nil] lastObject];
    //
    //self.nameField.inputAccessoryView    = toolBar;
    //self.phoneField.inputAccessoryView   = toolBar;
    //self.addressField.inputAccessoryView = toolBar;
}



#pragma mark - <---UITextField Delegate--->

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameField){
        [self.phoneField becomeFirstResponder];
    } else if (textField == self.phoneField) {
        [self.addressField becomeFirstResponder];
    } else if (textField == self.addressField){
        [self.view endEditing:YES];
    }

    return YES;
}

@end
