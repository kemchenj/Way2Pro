//
//  ViewController.m
//  freepaint
//
//  Created by kemchenj on 5/16/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STDrawView.h"
#import "MBProgressHUD.h"
#import "STHandleImageView.h"



@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet STDrawView *drawView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)save:(UIBarButtonItem *)sender
{
    UIGraphicsBeginImageContextWithOptions(_drawView.bounds.size, NO, 0);

    [_drawView.layer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError: contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    if (error) {
        MBProgressHUD *progressHUD = [MBProgressHUD new];
        progressHUD.labelText  = @"Failed to save";
        progressHUD.mode       = MBProgressHUDModeText;
        progressHUD.customView = [[UIImageView alloc] initWithImage:[[UIImage alloc] initWithContentsOfFile:@"error"]];
        [progressHUD showAnimated:YES
              whileExecutingBlock:^{
                  sleep(1);
              }
        ];
    } else {
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view
                                                          animated:YES
        ];

        progressHUD.labelText  = @"Save successfully";
        progressHUD.mode       = MBProgressHUDModeCustomView;
        progressHUD.customView = [[UIImageView alloc] initWithImage:[[UIImage alloc] initWithContentsOfFile:@"success"]];

        progressHUD.removeFromSuperViewOnHide = YES;

        [progressHUD hide:YES
               afterDelay:1
        ];
    }
}

- (IBAction)undo:(id)sender
{
    [_drawView undo];
}

- (IBAction)clear:(id)sender
{
    [_drawView clear];
}

- (IBAction)eraser:(UIBarButtonItem *)sender
{
    _drawView.lineColor = [UIColor whiteColor];
}

- (IBAction)pickColor:(UIButton *)sender
{
    _drawView.lineColor = sender.backgroundColor;
}

- (IBAction)pickPicture:(UIBarButtonItem *)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];

    imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;

    imagePickerController.delegate = self;

    [self presentViewController:imagePickerController
                       animated:YES
                     completion:nil
    ];
}

- (IBAction)lineWithChange:(UISlider *)sender
{
    _drawView.lineWidth = sender.value;
}



#pragma mark - <UIImagePickerController Delegate>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> *)info;
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];

    [self dismissViewControllerAnimated:YES
                             completion:nil
    ];

    STHandleImageView *handleImageView = [[STHandleImageView alloc] initWithFrame:_drawView.bounds];

    [self.view addSubview:handleImageView];

    handleImageView.image = image;
}

@end
