//
//  Photo.m
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithTitle:(NSString *)title downloadImageUrl:(NSURL *)downloadUrl image: (UIImage *)image
{
    self = [super init];
    if (self) {
        _title = title;
        _url = downloadUrl;
        _image = image;
    }
    return self;
}

@end
