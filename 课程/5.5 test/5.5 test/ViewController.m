//
//  ViewController.m
//  5.5 test
//
//  Created by kemchenj on 5/5/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

#import "STQuiz.h"

#import "MJExtension.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *hintBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *bigImgBtn;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *hintLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIView      *detailImageView;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;

@end



@implementation ViewController


- (IBAction)showPicture:(id)sender
{
    [UIView animateWithDuration:1 animations:^{
        self.detailImageView.hidden = NO;
        self.detailImageView.alpha  = 1;
        self.detailImage.alpha      = 1;
        //        self.imageTop.constant = 0;
        //        self.imageLeft.constant = 0;
        //        self.imageBottom.constant = 0;
    }];
}

- (IBAction)hint:(id)sender
{
    STQuiz   *quiz   = _quizArray[_quizIndex];
    UIButton *button = _answerButtons[_answeredIndex];
    button.titleLabel.text = [NSString stringWithFormat:@"%c", [quiz.answer characterAtIndex:self.answeredIndex]];
    self.scoreLabel.text = [NSString stringWithFormat: @"%d", self.scoreLabel.text.intValue - 100];
}

- (IBAction)nextQuiz:(id)sender
{
    self.quizIndex = self.quizIndex + 1;
}


#pragma mark - <---Property--->

- (NSArray *)quizArray
{
    if (!_quizArray) {
        _quizArray = [STQuiz mj_objectArrayWithFilename:@"questions.plist"];
    }
    return _quizArray;
}

-(NSUInteger)quizIndex
{
    return _quizIndex;
}



#pragma mark - <---View--->

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.quizIndex = 0;
}
-view

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.8 animations:^{
        self.detailImageView.alpha = 0;
        self.detailImage.alpha     = 0.5;
        [self.view layoutIfNeeded];
        //        self.imageTop.constant = 95;
        //        self.imageLeft.constant = 340;
        //        self.imageBottom.constant = 583;
    }];
    self.detailImageView.hidden = YES;
}


@end
