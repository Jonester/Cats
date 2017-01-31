//
//  Photo.h
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (strong, nonatomic) NSNumber *farm;
@property (strong, nonatomic) NSString *photoID;
@property (strong, nonatomic) NSString *serverID;
@property (strong, nonatomic) NSString *secretID;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *url;


//- (instancetype)initWithTitle:(NSString *)title andDownloadImageUrl:(NSURL *)downloadUrl;

- (instancetype)initWithFarm: (NSNumber *)farm
                     photoID: (NSString *)photoID
                    serverID: (NSString *)serverID
                     secretID: (NSString *)secretID
                       title: (NSString *)title;

@end
