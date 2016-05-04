//
//  ViewController.m
//  购物车
//
//  Created by kemchenj on 4/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STWineCell.h"
#import "STWine.h"
#import "MJExtension.h"



@interface ViewController () <STWineCellDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSArray        *wineArray;
@property(strong, nonatomic) NSMutableArray *shopCar;

@property(weak, nonatomic) IBOutlet UILabel     *totalPriceLabel;
@property(weak, nonatomic) IBOutlet UIButton    *buyBtn;
@property(weak, nonatomic) IBOutlet UITableView *tableView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
}

- (NSArray *)wineArray
{
    if (!_wineArray) {
        _wineArray = [STWine objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}

- (NSMutableArray *)shopCar
{
    if (!_shopCar) {
        self.shopCar = [NSMutableArray array];
    }
    return _shopCar;
}

- (void)dealloc
{
    for (STWine *wine in self.wineArray) {
    }
}



#pragma mark - <---STWineCell Delegate--->

- (void)wineCellDidClickPlusButton:(STWineCell *)wineCell
{
    int totalPrice = self.totalPriceLabel.text.intValue + wineCell.wine.money.intValue;
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];

    self.buyBtn.enabled = YES;

    if ([self.shopCar containsObject:wineCell.wine]) {
        return;
    }
    [self.shopCar addObject:wineCell.wine];
}

- (void)wineCellDidClickMinusButton:(STWineCell *)wineCell
{
    int totalPrice = self.totalPriceLabel.text.intValue - wineCell.wine.money.intValue;
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];

    self.buyBtn.enabled = self.wineArray.count > 0;

    if (wineCell.wine.count == 0) {
        [self.shopCar removeObject:wineCell.wine];
    }
}



#pragma mark - <---KVO Event--->

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(STWine *)wine change:(NSDictionary *)change context:(void *)context
{
    int new = [change[NSKeyValueChangeNewKey] intValue];
    int old = [change[NSKeyValueChangeOldKey] intValue];

    if (new > old) {
        int totalPrice = self.totalPriceLabel.text.intValue + wine.money.intValue;
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];

        self.buyBtn.enabled = YES;
    } else {
        int totalPrice = self.totalPriceLabel.text.intValue - wine.money.intValue;
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
        self.buyBtn.enabled       = totalPrice > 0;
    }
}



#pragma mark - <---按钮点击事件--->

- (IBAction)buy
{
    for (STWine *wine in self.shopCar) {
        if (wine.count) {
            NSLog(@"%d bottles of [%@]", wine.count, wine.name);
            wine.count = 0;
        }
    }
    [self.tableView reloadData];
    [self.shopCar removeAllObjects];
    self.buyBtn.enabled = NO;

    self.totalPriceLabel.text = @"0";
}

- (IBAction)clear
{
    for (STWine *wine in self.shopCar) {
        wine.count = 0;
    }

    [self.tableView reloadData];
    [self.shopCar removeAllObjects];

    self.buyBtn.enabled       = NO;
    self.totalPriceLabel.text = @"0";
}



#pragma mark - <---监听通知--->

- (void)plusClick:(NSNotification *)note
{
    STWineCell *cell      = note.object;
    int        totalPrice = self.totalPriceLabel.text.intValue + cell.wine.money.intValue;

    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];

    self.buyBtn.enabled = YES;
}

- (void)minusClick:(NSNotification *)note
{
    STWineCell *cell      = note.object;
    int        totalPrice = self.totalPriceLabel.text.intValue - cell.wine.money.intValue;

    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];

    if (!totalPrice) {
        self.buyBtn.enabled = NO;
    }
}



#pragma mark - <---TableView DataSource--->

// Amount Of Row in Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

// Create and Load Cell into View
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID   = @"wine";
    STWineCell      *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    cell.delegate = self;
    cell.wine     = self.wineArray[indexPath.row];

    return cell;
}

@end
