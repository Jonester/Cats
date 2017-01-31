//
//  Photo.h
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) UIImage *image;

- (instancetype)initWithTitle:(NSString *)title downloadImageUrl:(NSURL *)downloadUrl image: (UIImage *)image;

@end
