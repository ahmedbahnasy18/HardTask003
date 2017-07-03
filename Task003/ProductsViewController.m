//
//  ProductsViewController.m
//  Task003
//
//  Created by ahmed on 5/25/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

#import "ProductsViewController.h"
#import "BestSeller.h"
#import "Brand.h"
#import "BestSellersCollectionViewCell.h"
#import "BrandsCollectionViewCell.h"
#import "AFNetworking.h"

@interface ProductsViewController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation ProductsViewController

static NSString * const reuseIdentifier = @"BestSellersCollectionViewCell";
static NSString * const reuseIdentifier_2 = @"BrandsCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.BestSellersCollectioView.tag = 1;
    self.BrandsCollectionView.tag = 2;
    
    [self loadProducts];
    [self loadBrands];
    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.BestSellersCollectioView.collectionViewLayout = collectionViewFlowLayout;
    
    UICollectionViewFlowLayout *collectionViewFlowLayout_2 = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout_2 setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.BrandsCollectionView.collectionViewLayout = collectionViewFlowLayout_2;
}

-(void)loadProducts {
    
    NSURL *URL = [NSURL URLWithString:@"http://www.salonidepot.com/app/app.asmx/GetBestSellers?pageIndex=-1&loginUserId=0&countryId=1&currencyId=1"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        self.bestSellersArr = [BestSeller deserializeProductFromJSON:responseObject];
        [self.BestSellersCollectioView reloadData];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)loadBrands {
    
    NSURL *URL = [NSURL URLWithString:@"http://www.salonidepot.com/app/app.asmx/GetBrands?pageIndex=-1&userId=0&countryId=1&currencyId=1"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        self.brandsArr = [Brand deserializeBrandFromJSON:responseObject];
        [self.BrandsCollectionView reloadData];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1 ;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if(collectionView.tag == 1){
        return self.bestSellersArr.count;
    }else if (collectionView.tag == 2){
        return self.brandsArr.count;
    }
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(collectionView.tag == 1){
        BestSellersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        [cell setEntity:[self.bestSellersArr objectAtIndex:indexPath.row]];
        cell.layer.borderWidth=0.2f;
        cell.layer.borderColor=[UIColor grayColor].CGColor;
        return cell;
    }else if(collectionView.tag == 2){
        BrandsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier_2 forIndexPath:indexPath];
        [cell setEntity:[self.brandsArr objectAtIndex:indexPath.row]];
        return cell;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width;
    CGFloat height;
    if(collectionView.tag == 1){
        width=CGRectGetWidth(collectionView.frame)/2.0f-5;
        height=CGRectGetHeight(collectionView.frame)/2.0f;
    }else if(collectionView.tag == 2){
        width=CGRectGetWidth(collectionView.frame)/3.0f-5;
        height=CGRectGetHeight(collectionView.frame);
    }
    return CGSizeMake(width,height);
}


@end
