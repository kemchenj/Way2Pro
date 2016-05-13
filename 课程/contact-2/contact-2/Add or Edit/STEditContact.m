//
//  STEditContact.m
//  contact-2
//
//  Created by kemchenj on 5/11/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STEditContact.h"
#import "STContactItem.h"



@interface STEditContact ()

@property (weak, nonatomic) IBOutlet UITextField     *nameField;
@property (weak, nonatomic) IBOutlet UITextField     *phoneNumberField;
@property (weak, nonatomic) IBOutlet UIButton        *finishButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end



@implementation STEditContact

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameField.text        = self.contactItem.name;
    self.phoneNumberField.text = self.contactItem.phoneNumber;
}

- (IBAction)clickEditButton
{
    if ([self.editButton.title isEqualToString:@"编辑"]) {
        self.editButton.title = @"取消";

        self.nameField.text        = _contactItem.name;
        self.phoneNumberField.text = _contactItem.phoneNumber;

        self.nameField.enabled        = YES;
        self.phoneNumberField.enabled = YES;

        self.finishButton.hidden = NO;
        [self.phoneNumberField becomeFirstResponder];
    } else {
        self.editButton.title = @"编辑";

        self.nameField.enabled        = NO;
        self.phoneNumberField.enabled = NO;

        self.nameField.text        = _contactItem.name;
        self.phoneNumberField.text = _contactItem.phoneNumber;

        self.finishButton.hidden = YES;
    }
}

- (IBAction)clickAddButton
{
    self.contactItem.name        = self.nameField.text;
    self.contactItem.phoneNumber = self.phoneNumberField.text;
    [self.delegate editContactItem:self.contactItem];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
