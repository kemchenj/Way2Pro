//
//  ViewController.m
//  5.7 test
//
//  Created by kemchenj on 5/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STViewController.h"
#import "STPeopleNearby.h"
#import "STTitleView.h"



@interface STViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UITabBar          *tabBar;
@property (nonatomic, strong) STTitleView *titleView;
@property (nonatomic, strong) UIScrollView             *scrollView;

@end



@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setup];
}

- (void)setup
{
    CGSize navigationBarSize = self.navigationController.navigationBar.frame.size;

    // 标题
    STTitleView *titleView = [[STTitleView alloc] initWithFrame:CGRectMake(navigationBarSize.width / 2 - 60, 0, 120, navigationBarSize.height)];
    titleView.clipsToBounds       = YES;
    self.titleView                = titleView;
    self.navigationItem.titleView = titleView;

    // 右边的按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"附近"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(PeopleNearby)
    ];

    // 左边的按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"home_down"]
         forState:UIControlStateNormal
    ];
    [btn setTitle:@"罗马"
         forState:UIControlStateNormal
    ];
    [btn setTitleColor:[UIColor blackColor]
              forState:UIControlStateNormal
    ];
    btn.frame = CGRectMake(0, 0, 60, self.navigationController.navigationBar.frame.size.height);

    UIView *btnView = [[UIView alloc] init];
    btnView.frame = CGRectMake(0, 0, 60, navigationBarSize.height);
    [btnView addSubview:btn];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:btnView]];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];



    // Content
    CGFloat scrollViewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;

    // Content (Left View)
    UITableView *leftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, scrollViewW, scrollViewH)];
    leftView.backgroundColor = [UIColor brownColor];
    [self.scrollView addSubview:leftView];

    // Content (Right View)
    UITableView *rightView = [[UITableView alloc] initWithFrame:CGRectMake(scrollViewW, 0, scrollViewW, scrollViewH)];
    rightView.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:rightView];

    // Content (Attribute)
    [self.scrollView setPagingEnabled:YES];
    self.scrollView.delegate    = self;
    self.scrollView.contentSize = CGSizeMake(2 * scrollViewW, 0);

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(scrollToRight)
                                                 name:@"STScrollToRight"
                                               object:nil
    ];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(scrollToLeft)
                                                 name:@"STScrollToLeft"
                                               object:nil
    ];
}



#pragma mark - <NavigationBar Page>

- (void)PeopleNearby
{
    STPeopleNearby *peopleNearby = [[STPeopleNearby alloc] initWithNibName:nil
                                                                    bundle:nil
    ];
    [self.navigationController pushViewController:peopleNearby
                                         animated:YES
    ];
}



#pragma mark - <ScrollView>

- (void)scrollToRight
{
    [self.scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0)
                             animated:YES
    ];
}

- (void)scrollToLeft
{
    [self.scrollView setContentOffset:CGPointMake(0, 0)
                             animated:YES
    ];

}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }

    return _scrollView;
}



#pragma mark - <ScrollView Delegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.titleView.percent = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
}

@end
