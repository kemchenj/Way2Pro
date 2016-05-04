//
//  ViewController.m
//  customCell
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STTg.h"
#import "STTgCell.h"
#import "STPageView.h"
#import "STLoadMoreFooter.h"
#import "MJExtension/MJExtension.h"



@interface ViewController () <UITableViewDataSource, STLoadMoreFooterDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray     *tgs;

@end



@implementation ViewController

#pragma mark - <---UIView--->

- (void)viewDidLoad
{
    [super viewDidLoad];

    STPageView *pageView = [STPageView pageView];
    pageView.imagesName            = @[@"ad_00", @"ad_01", @"ad_02", @"ad_03", @"ad_04"];
    self.tableView.tableHeaderView = pageView;

    STLoadMoreFooter *footer = [STLoadMoreFooter footer];
    footer.delegate                = self;
    self.tableView.tableFooterView = footer;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}



#pragma mark - <---Property--->

- (NSMutableArray *)tgs
{
    if (!_tgs) {
        _tgs = [STTg objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}



#pragma mark - <---Loading Footer--->

- (void)loadMoreFooterDidClickLoadMoreButton:(STLoadMoreFooter *)loadMoreFooter
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < 4; ++i) {
            STTg *tg = [[STTg alloc] init];
            tg.icon     = @"ad_02";
            tg.price    = @"999.9";
            tg.title    = @"XXX酒店打折";
            tg.buyCount = [NSString stringWithFormat:@"%d", arc4random_uniform(1000)];;
            [self.tgs addObject:tg];
        }

        [self.tableView reloadData];

        STLoadMoreFooter *footer = (STLoadMoreFooter *) self.tableView.tableFooterView;
        [footer endLoading];
    });
}



#pragma mark - <---TableView DataSource--->

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID   = @"tg";
    STTgCell        *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"STTgCell" owner:nil options:nil] lastObject];
    }

    cell.tg = self.tgs[(NSUInteger) indexPath.row];

    return cell;
}

@end