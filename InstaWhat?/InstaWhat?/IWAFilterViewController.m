//
//  IWAFilterViewController.m
//  InstaWhat?
//
//  Created by JOSH HENDERSHOT on 8/25/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "IWAFilterViewController.h"
#import "IWAEditPhotoViewController.h"

@interface IWAFilterViewController ( )<UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>

@end

@implementation IWAFilterViewController
{
    UIImageView * imageView;
    UICollectionView * filterCollection;
    NSArray * filters;
    NSMutableDictionary * filteredImage;
}
- (instancetype)init
{
    self = [super init];
    if (self) {

        filters = @[
//                    @"CIColorCrossPolynomial",
//                    @"CIColorCube",
//                    @"CIColorCubeWithColorSpace",
//                    @"CIColorInvert",
//                    @"CIColorMap",
//                    @"CIColorMonochrome",
//                    @"CIColorPosterize",
//                    @"CIFalseColor",
//                    @"CIMaskToAlpha",
//                    @"CIMaximumComponent",
//                    @"CIMinimumComponent",
//                    @"CIPhotoEffectChrome",
//                    @"CIPhotoEffectFade",
//                    @"CIPhotoEffectInstant",
//                    @"CIPhotoEffectMono",
//                    @"CIPhotoEffectNoir",
//                    @"CIPhotoEffectProcess",
//                    @"CIPhotoEffectTonal",
                    @"CIPhotoEffectTransfer",
                    @"CISepiaTone",
                    @"CIVignette",
                    @"CIVignetteEffect"
                    ];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.view addSubview:imageView];
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 100);
        filterCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 320, 320, [UIScreen mainScreen].bounds.size.height - 320)collectionViewLayout:layout];
        filterCollection.dataSource = self;
        filterCollection.delegate = self;
        [filterCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:filterCollection];
        
        self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self
                                                      action:@selector(showEditImage:)];
        
        filteredImage = [@{}mutableCopy];

    }
    return self;
}
-(void)setOriginalImage:(UIImage *)originalImage
{
    _originalImage = originalImage;
    imageView.image = originalImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * key =[NSString stringWithFormat:@"%d", indexPath.item];
    [self showFilterWithImage:filteredImage[key]];

//    filterVC.editImage = image;
}
-(void)showFilterWithImage:(UIImage*)image
{
    IWAEditPhotoViewController * filterVC = [[IWAEditPhotoViewController alloc]init];
    filterVC.editImage = image;
    [self.navigationController pushViewController:filterVC animated:YES];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  filters.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSString * filterName = filters[indexPath.item];
    UIImageView * filterView = [[UIImageView alloc]initWithFrame:cell.bounds];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        UIImage * filterImage = [self filterImageWithFilterName:filterName];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            filterView.image = filterImage;
            [filteredImage setObject:filterImage forKey:[NSString stringWithFormat:@"%d", indexPath.item]];
        });
    });
    
    [cell addSubview:filterView];
    
    return cell;
}
-(UIImage *)filterImageWithFilterName:(NSString *)filterName
{
    // Turn UIImage into CIImage
    CIImage * ciImage = [CIImage imageWithCGImage:self.originalImage.CGImage];
    
    // Create CIFilter with filtername
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    // add CIImage to the filter
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    // get filtered image from filter
    CIImage * ciResult = [filter outputImage];
    
    // set up context to turn CIImage into CGImage
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    // init UIImage with CGImage
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
}

-(void)showEditImage:(UIImage*)image
{
    IWAEditPhotoViewController * filterVC = [[IWAEditPhotoViewController alloc]init];
    filterVC.editImage = image;
    [self.navigationController pushViewController:filterVC animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
