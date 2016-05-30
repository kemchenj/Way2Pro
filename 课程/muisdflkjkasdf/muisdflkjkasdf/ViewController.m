//
//  ViewController.m
//  muisdflkjkasdf
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STApp.h"



@interface ViewController ()

@property (nonatomic, strong) NSArray             *apps;
@property (nonatomic, strong) NSOperationQueue    *queue;
@property (nonatomic, strong) NSMutableDictionary *images;
@property (nonatomic, strong) NSMutableDictionary *operations;

@end



@implementation ViewController

- (NSArray *)apps;
{
    if (!_apps) {
        NSArray *apps = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps"
                                                                                         ofType:@"plist"]
        ];

        NSMutableArray *array = [NSMutableArray array];
        for (STApp     *app in apps) {
            [array addObject:app];
        }
        return array;
    }
    return _apps;
}

- (NSOperationQueue *)queue;
{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }

    return _queue;
}

- (NSMutableDictionary *)images;
{
    if (!_images) {
        _images = [[NSMutableDictionary alloc] init];
    }

    return _images;
}

- (NSMutableDictionary *)operations;
{
    if (!_operations) {
        _operations = [[NSMutableDictionary alloc] init];
    }

    return _operations;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}



#pragma mark - <tableview>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *ID = @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    STApp *app = self.apps[indexPath.row];
    cell.textLabel.text       = app.name;
    cell.detailTextLabel.text = app.download;

    UIImage *image = self.images[app.icon];
    if (image) {
        NSLog(@"Use Ram Cahce");
        cell.imageView.image = image;
    } else {
        NSString *fileName  = [app.icon lastPathComponent];
        NSString *caches    = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *fullPath  = [caches stringByAppendingPathComponent:fileName];
        NSData   *imageData = [NSData dataWithContentsOfFile:fullPath];

        if (imageData) {
            UIImage *image1 = [UIImage imageWithData:imageData];
            cell.imageView.image = image1;

            self.images[app.icon] = image1;

            NSLog(@"Use Disk Cache");
        } else {
            NSBlockOperation *download = self.operations[app.icon];
            if (download) {
                NSLog(@"Downloading, Please Wait");
            } else {
                download = [NSBlockOperation blockOperationWithBlock:^{
                    NSLog(@"indexPath.row = %i", indexPath.row);

                    NSURL   *url     = [NSURL URLWithString:app.icon];
                    NSData  *data    = [NSData dataWithContentsOfURL:url];
                    UIImage *uiImage = [UIImage imageWithData:data];

                    self.images[app.icon] = uiImage;

                    [data writeToFile:fullPath
                           atomically:YES
                    ];

                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        [tableView reloadRowsAtIndexPaths:@[indexPath]
                                         withRowAnimation:UITableViewRowAnimationAutomatic
                        ];

                        NSLog(@"%i row Donwload Succeceed", indexPath.row);
                    }];
                }];
                self.operations[app.icon] = download;
                [self.queue addOperation:download];
            }
        }
    }

    return cell;
}


@end
