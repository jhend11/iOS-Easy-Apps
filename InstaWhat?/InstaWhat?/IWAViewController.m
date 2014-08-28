//
//  IWAViewController.m
//  InstaWhat?
//
//  Created by JOSH HENDERSHOT on 8/21/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "IWAViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "IWAFilterViewController.h"

@interface IWAViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation IWAViewController
{
    UIImagePickerController * imagePicker;
    NSMutableArray * photos;
    ALAssetsLibrary * library;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    photos = [@[]mutableCopy];
    
    imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    imagePicker.view.frame = CGRectMake(0, 0, 320, 320);
    imagePicker.showsCameraControls = NO;
    [self.view addSubview:imagePicker.view];
    [self addChildViewController:imagePicker];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    
    UICollectionView * photoCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height - 320)collectionViewLayout:layout];

    photoCollection.dataSource = self;
    photoCollection.delegate = self;
    [photoCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:photoCollection];
    
    
    library = [[ALAssetsLibrary alloc]init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop)
          {
              NSLog(@"type %@", [result valueForProperty:ALAssetPropertyType]);
              if(result) [photos addObject:result];
              
              [photoCollection reloadData];
          }];
     }failureBlock:^(NSError *error){
         
     }];
    

    
    UIButton * takePictureButton = [[UIButton alloc]initWithFrame:CGRectMake(110, 260, 100, 100)];
    takePictureButton.backgroundColor = [UIColor blackColor];
    takePictureButton.layer.cornerRadius = 50;
    [takePictureButton addTarget:self action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:takePictureButton];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ALAsset * photo = photos[indexPath.item];
    UIImageView * thumbnailView = [[UIImageView alloc]initWithFrame:cell.bounds];
    thumbnailView.image = [UIImage imageWithCGImage:photo.thumbnail];
    [cell.contentView addSubview:thumbnailView];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UIImageView * bigView = [[UIImageView alloc] initWithFrame:imagePicker.view.frame];
    ALAsset * photo = photos[indexPath.item];
    ALAssetRepresentation * representation = photo.defaultRepresentation;
//    bigView.image = [UIImage imageWithCGImage:representation.fullResolutionImage];
    
    [self showFilterWithImage:[UIImage imageWithCGImage:representation.fullResolutionImage]];

//    [self.view addSubview:bigView];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return photos.count;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = info[UIImagePickerControllerOriginalImage];
    [self.view addSubview:imageView];
    
//    [self showFilterWithImage:info[UIImagePickerControllerOriginalImage]];
    
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [imagePicker takePicture];
   
}

-(void)showFilterWithImage:(UIImage*)image
{
    IWAFilterViewController * filterVC = [[IWAFilterViewController alloc]init];
    filterVC.originalImage = image;
    [self.navigationController pushViewController:filterVC animated:YES];
}

-(void)takePicture
{
    [imagePicker takePicture];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
