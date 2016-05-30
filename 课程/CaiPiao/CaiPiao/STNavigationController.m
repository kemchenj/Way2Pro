//
//  STNavigationController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STNavigationController.h"



@interface STNavigationController ()

@property (nonatomic, strong) id popDelegate;

@property (nonatomic, strong) UIImage            *image;
@property (nonatomic, weak) IBOutlet UITextField *field;

@end



@implementation STNavigationController

+ (void)initialize;
{
    if (self == [STNavigationController class]) {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"]
                  forBarMetrics:UIBarMetricsDefault
        ];

        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        dictionary[NSFontAttributeName]            = [UIFont systemFontOfSize:20];
        dictionary[NSForegroundColorAttributeName] = [UIColor whiteColor];

        [bar setTitleTextAttributes:dictionary];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupPanGesture];
}

- (void)setupPanGesture;
{
    _popDelegate = self.interactivePopGestureRecognizer.delegate;

    self.delegate = self;

    id ges = self.interactivePopGestureRecognizer.delegate;

    self.interactivePopGestureRecognizer.enabled = NO;

    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate
                                                                                           action:@selector(handleNavigationTransition:)
    ];

    panGestureRecognizer.delegate = self;

    [self.view addGestureRecognizer:panGestureRecognizer];
}



#pragma mark - <UIGestureRecognizer Delegate>

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
{
    return self.childViewControllers.count != 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    if (self.childViewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed         = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"]
                                                                                           style:UIBarButtonItemStyleBordered
                                                                                          target:self
                                                                                          action:@selector(back)
        ];
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }


    NSLog(@"Hide: %d", viewController.hidesBottomBarWhenPushed);
    [super pushViewController:viewController
                     animated:animated
    ];
}

- (void)back;
{
    [self popViewControllerAnimated:YES];
}


@end
