//
// Created by kemchenj on 5/7/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "Flag.h"
#import "FlagView.h"
#import "FlagField.h"



@interface FlagField () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *flags;

@end



@implementation FlagField

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupData];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupData];
    }

    return self;
}



- (NSMutableArray *)flags
{
    if (!_flags) {
        _flags = [NSMutableArray array];

        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags"
                                                             ofType:@"plist"
        ];
        NSArray  *dictArr  = [NSArray arrayWithContentsOfFile:filePath];

        for (NSDictionary *dictionary in dictArr) {
            Flag *flag = [Flag flagWithDict:dictionary];
            [_flags addObject:flag];
        }
    }

    return _flags;
}

- (void)setupData
{
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate   = self;

    self.inputView = pickerView;
}



#pragma mark - <UIPickerView Data Source>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flags.count;
}



#pragma mark - <UIPicker Delegate>

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    Flag *flag = self.flags[row];
    self.text = flag.name;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 150;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    FlagView *flagView = [FlagView flagView];

    flagView.flag = self.flags[row];

    return flagView;
}


@end