//
//  STNewFeatureViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STNewFeatureViewController.h"
#import "STNewFeatureCollectionViewCell.h"


@interface STNewFeatureViewController ()

@property (nonatomic, assign) CGFloat   lastOffsetX;
@property (nonatomic, weak) UIImageView *guide;
@property (nonatomic, weak) UIImageView *smallText;
@property (nonatomic, weak) UIImageView *largerText;

@end



@implementation STNewFeatureViewController

static NSString *const reuseIdentifier = @"Cell";

- (instancetype)init;
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

    flowLayout.itemSize                = [UIScreen mainScreen].bounds.size;
    flowLayout.minimumLineSpacing      = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection         = UICollectionViewScrollDirectionHorizontal;

    return [self initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    [self setupCollectionView];
    [self setupChildView];

    _lastOffsetX = 0;
}

- (void)setupChildView;
{
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guide    = guide;
    guide.centerX = self.view.centerX;
    [self.collectionView addSubview:guide];

    UIImageView *largerText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.largerText    = largerText;
    largerText.centerX = self.view.centerX;
    largerText.centerY = self.view.bounds.size.height * 0.8;
    [self.collectionView addSubview:largerText];

    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.smallText    = smallText;
    smallText.centerX = self.view.centerX;
    smallText.centerY = self.view.bounds.size.height * 0.9;
    [self.collectionView addSubview:smallText];

    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 100;
    [self.collectionView addSubview:guideLine];
}

- (void)setupCollectionView;
{
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:reuseIdentifier
    ];

    self.collectionView.bounces                        = NO;
    self.collectionView.pagingEnabled                  = NO;
    self.collectionView.showsHorizontalScrollIndicator = YES;
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    STNewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                           forIndexPath:indexPath
    ];

    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",
                                                     indexPath.item + 1];

    cell.image = [UIImage imageNamed:imageName];

    [cell setIndexPath:indexPath
                 count:4];

    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat delta   = offsetX - _lastOffsetX;

    _guide.x += 2 * delta;
    _smallText.x += 2 * delta;
    _largerText.x += 2 * delta;

    [UIView animateWithDuration:0.25
                     animations:^{
                         _guide.x -= delta;
                         _smallText.x -= delta;
                         _largerText.x -= delta;
                     }
    ];

    _lastOffsetX = offsetX;
}


@end
