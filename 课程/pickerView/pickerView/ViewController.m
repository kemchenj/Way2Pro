//
//  ViewController.m
//  pickerView
//
//  Created by kemchenj on 5/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel      *titleLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *foods;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.pickerView.delegate   = self;
    self.pickerView.dataSource = self;
}

- (NSArray *)foods
{
    if (_foods == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"];
        _foods = [NSArray arrayWithContentsOfFile:filePath];
    }

    return _foods;
}



#pragma mark - <UIPickerView DataSource>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *array = self.foods[component];
    return array.count;
}



#pragma mark - <UIPickerView Delegate>

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *array = self.foods[component];
    return array[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%ld %ld", component, row);
    NSString *title = self.foods[component][row];
    self.titleLabel.text = title;
}


@end
