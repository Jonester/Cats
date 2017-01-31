//
//  Photo.m
//  Cats
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithFarm: (NSNumber *)farm
                     photoID: (NSString *)photoID
                    serverID: (NSString *)serverID
                     secretID: (NSString *)secretID
                       title: (NSString *)title
{
    self = [super init];
    if (self) {
        _farm = farm;
        _photoID = photoID;
        _serverID = serverID;
        _secretID = secretID;
        _title = title;
        _urlString = [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/%@_%@.jpg", [_farm integerValue], _serverID, _photoID, _secretID];
        _url = [NSURL URLWithString:_urlString];
    }
    return self;
}

@end

//https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
