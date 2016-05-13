//
//  STContactViewController.m
//  Contact
//
//  Created by kemchenj on 5/9/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STContactViewController.h"
#import "Add or Edit/STAddContact.h"
#import "Model/STContactItem.h"
#import "STEditContact.h"



@interface STContactViewController () <UITableViewDelegate, UITableViewDataSource,
        STAddContactDelegate, STEditContactDelegate>

@property (nonatomic, strong) NSMutableArray *contactItems;

@end



@implementation STContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self tableViewDelegateSetup];
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录", self.accountName];
}

- (IBAction)logout:(id)sender
{
    [self showAlertWithTitle:@"确定要退出吗" confirmAction:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)showAlertWithTitle:(NSString *)title confirmAction:(void (^)(UIAlertAction *))confirmAction
{
    UIAlertController *STAlert = [UIAlertController alertControllerWithTitle:title
                                                                     message:nil
                                                              preferredStyle:UIAlertControllerStyleActionSheet
    ];

    UIAlertAction *Confirm = [UIAlertAction actionWithTitle:@"确定"
                                                      style:UIAlertActionStyleDefault
                                                    handler:confirmAction
    ];
    [STAlert addAction:Confirm];

    UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction *_Nonnull action) {}
    ];
    [STAlert addAction:Cancel];

    [self presentViewController:STAlert
                       animated:YES
                     completion:nil
    ];
}



#pragma mark - <Property>

- (NSMutableArray *)contactItems
{
    if (!_contactItems) {
        _contactItems = [NSMutableArray array];
    }
    return _contactItems;
}



#pragma mark - <UITableView Datasource>

- (void)tableViewDelegateSetup
{
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell       = [tableView dequeueReusableCellWithIdentifier:identifier];
    STContactItem   *item       = self.contactItems[(NSUInteger) indexPath.row];

    cell.textLabel.text       = item.name;
    cell.detailTextLabel.text = item.phoneNumber;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"共%d个联系人", self.contactItems.count];
//}



#pragma mark - <STContactViewController Delegate>

- (void)addContactItem:(STContactItem *)contactItem
{
    [self.contactItems addObject:contactItem];
    [self.tableView reloadData];
    [self.tableView reloadData];
}



#pragma mark - <STEditContact Delegate>

- (void)editContactItem:(STContactItem *)contactItem
{
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];

    if ([segue.identifier isEqualToString:@"add"]) {
        STAddContact *addContact = segue.destinationViewController;
        addContact.delegate = self;
    } else if ([segue.identifier isEqualToString:@"edit"]) {
        STEditContact *editContact = segue.destinationViewController;
        editContact.delegate = self;

        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        editContact.contactItem = self.contactItems[(NSUInteger) indexPath.row];
    }
}


@end
