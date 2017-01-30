//
//  Photo.m
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initURLWith: (NSString*)farm
                    photoID: (NSString *)photoID
                   serverID: (NSString *)serverID
                    secreID: (NSString *)secretID
{
    self = [super init];
    if (self) {
        _farm = farm;
        _photoID = photoID;
        _serverID = serverID;
        _secretID = secretID;
        _fullString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", _farm, _serverID, _photoID, _secretID];
        _address = [NSURL URLWithString:_fullString];
    }
    return self;
}

@end
