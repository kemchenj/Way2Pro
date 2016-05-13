//
//  STAddContact.m
//  Contact
//
//  Created by kemchenj on 5/10/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STAddContact.h"
#import "STContactItem.h"



@interface STAddContact ()

@property (weak, nonatomic) IBOutlet UIButton    *addButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;

@end



@implementation STAddContact

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupTextField];
}

- (IBAction)addContact:(id)sender
{
    STContactItem *contactItem = [STContactItem itemWithName:self.nameField.text
                                                 phoneNumber:self.phoneNumberField.text
    ];
    [self.delegate addContactItem:contactItem];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - <TextField and Switch>

- (void)setupTextField
{
    [self.nameField addTarget:self
                       action:@selector(textChanged)
             forControlEvents:UIControlEventEditingChanged
    ];

    [self.phoneNumberField addTarget:self
                              action:@selector(textChanged)
                    forControlEvents:UIControlEventEditingChanged
    ];

    [self.nameField becomeFirstResponder];
}

- (void)textChanged
{
    self.addButton.enabled = self.nameField.text.length && self.phoneNumberField.text.length;
}


@end
