//
// Created by kemchenj on 5/9/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "CityField.h"
#import "Province.h"



@interface CityField () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, assign) NSInteger      setProvinceIndex;
@property (nonatomic, strong) NSMutableArray *provinces;

@end



@implementation CityField

- (void)awakeFromNib
{
    [self setup];
}

- (NSMutableArray *)provinces
{
    if (!_provinces) {
        _provinces = [NSMutableArray array];

        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"provinces"
                                                             ofType:@"plist"
        ];

        NSArray           *dictArray = [NSArray arrayWithContentsOfFile:filePath];
        for (NSDictionary *dictionary in dictArray) {
            Province *province = [Province provinceWithDict:dictionary];
            [_provinces addObject:province];
        }
    }

    return _provinces;
}

- (void)setup
{
    UIPickerView *pickerView = [[UIPickerView alloc] init];

    pickerView.dataSource = self;
    pickerView.delegate   = self;
    
    self.inputView = pickerView;
}

- (void)setupText
{
    [self pickerView:nil
        didSelectRow:0
         inComponent:0
    ];
}


#pragma mark - <UIPickerView DataSource>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provinces.count;
    } else {
        Province *province = self.provinces[self.setProvinceIndex];
        return province.cities.count;
    }
}



#pragma mark - <UIPickerView Delegate>

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        Province *province = self.provinces[row];
        return province.name;
    } else {
        Province *province = self.provinces[_setProvinceIndex];
        return province.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _setProvinceIndex = row;
        [pickerView reloadComponent:1];
    }

    Province *province = self.provinces[_setProvinceIndex];

    NSString *provinceName = province.name;

    NSInteger cityIndex = [pickerView selectedRowInComponent:1];

    NSString *cityName = province.cities[cityIndex];

    self.text = [NSString stringWithFormat:@"%@ %@", provinceName, cityName];
}

@end