//
//  ViewController.m
//  时间监听
//
//  Created by kemchenj on 4/26/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. UIButton
    UIButton *btn = nil;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 2. UIScrollView
    UIScrollView *scrollView = nil;
    scrollView.delegate = self;
    
    self.textField.delegate = self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.textField endEditing:YES];
//    [self.textField resignFirstResponder];
    
    [self.view endEditing:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"终止编辑");
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"开始编辑");
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"should change characters in range -- %@", string);
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    return YES;
}

-(void)btnClick:(UIButton *)btn
{
    
}

@end
