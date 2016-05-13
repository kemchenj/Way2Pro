//
//  STContactViewController.m
//  Contact
//
//  Created by kemchenj on 5/9/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STContactViewController.h"
#import "STAddContact.h"
#import "STContactItem.h"



@interface STContactViewController () <UITableViewDelegate, UITableViewDataSource, STAddContactDelegate>

@property (nonatomic, strong) NSMutableArray *contactItems;

@end



@implementation STContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录", self.accountName];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"contact";
    UITableViewCell *cell       = [tableView dequeueReusableCellWithIdentifier:identifier];
    STContactItem   *item       = self.contactItems[(NSUInteger) indexPath.row];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:identifier
        ];
    }

    cell.textLabel.text       = item.name;
    cell.detailTextLabel.text = item.phoneNumber;

    return cell;
}



#pragma mark - <STContactViewController Delegate>

- (void)contactViewController:(STAddContact *)addContact contactItem:(STContactItem *)contactItem
{
    [self.contactItems addObject:contactItem];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];

    STAddContact *addContact = segue.destinationViewController;
    addContact.delegate = self;
}


@end
