//
//  ViewController.m
//  textField-2
//
//  Created by kemchenj on 5/1/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import <IQKeyboardManager/IQKeyboardReturnKeyHandler.h>
#import <MJExtension/MJExtension.h>



@interface ViewController ()

@property(weak, nonatomic) IBOutlet UITextField         *phoneField;
@property(nonatomic, strong) IQKeyboardReturnKeyHandler *handler;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.phoneField.tintColor = [UIColor blueColor];

    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.shouldResignOnTouchOutside          = YES;
    manager.shouldShowTextFieldPlaceholder      = NO;
    manager.shouldToolbarUsesTextFieldTintColor = YES;

    self.handler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.handler.lastTextFieldReturnKeyType = UIReturnKeyDone;
}

@end
