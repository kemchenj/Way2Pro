//
//  DetailViewController.m
//  Detail
//
//  Created by kemchenj on 5/12/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//




#import "DetailViewController.h"



@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end



@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate   = self;
    self.tableView.dataSource = self;

    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.navigationController.navigationBar.alpha = 0;

    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]
                                                  forBarMetrics:UIBarMetricsDefault
    ];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);
}



#pragma mark - <Tableview DataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell       = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:identifier
        ];
    }

    cell.textLabel.text = @"kem";

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}



@end
