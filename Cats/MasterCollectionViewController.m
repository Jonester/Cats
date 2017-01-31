//
//  MasterCollectionViewController.m
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "MasterCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "Photo.h"

@interface MasterCollectionViewController ()

@property (strong, nonatomic) NSMutableArray *photosArray;
@property (strong, nonatomic) Photo *photo;

@end

@implementation MasterCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photosArray = [NSMutableArray new];
    
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=d03d341e56d31ac876ad9eec528309d4&tags=cat"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"error: %@",error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *firstPhotosDict = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:0
                                                                          error:&jsonError];
        
        if (jsonError) {
            NSLog(@"json Error: %@", jsonError.localizedDescription);
            return;
        }
        
        NSDictionary *secondPhotosDict = [firstPhotosDict valueForKey:@"photos"];
        NSArray *allPhotos = [secondPhotosDict valueForKey:@"photo"];
        
        for (NSDictionary *photoElements in allPhotos) {
            
            NSString *urlString = [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/%@_%@.jpg", [[photoElements valueForKey:@"farm"] integerValue], [photoElements valueForKey:@"server"], [photoElements valueForKey:@"id"], [photoElements valueForKey:@"secret"]];
            
            self.photo = [[Photo alloc]initWithTitle:[photoElements valueForKey:@"title"]
                                    downloadImageUrl:[NSURL URLWithString:urlString]
                                               image:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]]];
            
            [self.photosArray addObject:self.photo];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.collectionView reloadData]; // try with and without
            
        }];
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.photosArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Photo *photoObject = self.photosArray[indexPath.row];
    [cell setPhoto:photoObject];
    
    return cell;
}


@end
