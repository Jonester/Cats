//
//  Photo.h
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (strong, nonatomic) NSString *farm;
@property (strong, nonatomic) NSString *photoID;
@property (strong, nonatomic) NSString *serverID;
@property (strong, nonatomic) NSString *secretID;
@property (strong, nonatomic) NSString *fullString;
@property (strong, nonatomic) NSURL *address;

@end
