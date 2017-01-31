//
//  PhotoCollectionViewCell.m
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "Photo.h"

@implementation PhotoCollectionViewCell

-(void)setPhoto:(Photo *)photo {
    self.cellImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:photo.url]];
    self.cellLabel.text = photo.title;
}

@end
