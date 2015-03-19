//
//  TestSelectMorePhotoViewController.m
//  MyLibrary
//
//  Created by nero on 15/3/19.
//  Copyright (c) 2015年 nero. All rights reserved.
//

#import "TestSelectMorePhotoViewController.h"

#import "ELCImagePickerHeader.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
@interface TestSelectMorePhotoViewController ()
@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation TestSelectMorePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 100);
    
    [button setTitle:@"选择图片" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(selec) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(200, 200, 100, 100);
    [self.view addSubview:imageView];
    imageView.animationDuration = 2;
    self.imageView = imageView;
}
#pragma mark - 选择图库
-(void) selec {
    
    ELCImagePickerController *picker = [[ELCImagePickerController alloc] initImagePicker];
    picker.maximumImagesCount = 15 ;//最大照片数量
    picker.returnsOriginalImage = YES;
    picker.returnsImage = YES;
    picker.onOrder = YES;
    picker.mediaTypes = @[(NSString *)kUTTypeImage]; // , (NSString *)kUTTypeMovie
    picker.imagePickerDelegate = self;
    
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
    
}
#pragma mark ELC image Picker Delegate

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    NSMutableArray *images  = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSDictionary *dict in info) {
            
            if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
                if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                    //                    原始图
                    UIImage *image = [dict objectForKey:UIImagePickerControllerOriginalImage];
                    //                    缩略图
                    UIImage *thumbImage = [dict objectForKey:@"UIImagePickerControllerThumbImage"];
                    [images addObject:image];
                } else {
                    NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
                }
            } else {
                NSLog(@"Uknown asset type");
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.animationImages = images;
            [self.imageView startAnimating];
            
        });
        
    });
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    picker = nil;
}
#pragma mark - 选择相册
- (void)vselectCamera {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeImage, nil];
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker
                       animated:YES
                     completion:^{
                         
                     }];
}
#pragma mark  取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    picker = nil;
}
#pragma mark  成功
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaTyep = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaTyep isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    picker = nil;
}


@end
