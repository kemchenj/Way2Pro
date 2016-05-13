//
// Created by kemchenj on 5/9/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "BirthdayField.h"



@implementation BirthdayField

- (void)awakeFromNib
{
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }

    return self;
}

-(void)setup
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];

    datePicker.datePickerMode = UIDatePickerModeDate;

    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [dateFormatter dateFromString:@"1990-01-01"];

    datePicker.date = date;

    [datePicker addTarget:self
                   action:@selector(dateChange:)
         forControlEvents:UIControlEventValueChanged
    ];

    self.inputView = datePicker;
}

-(void)dateChange:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [dateFormatter stringFromDate:datePicker.date];
    self.text = dateStr;
}


@end