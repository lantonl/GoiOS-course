//
//  Exhibition.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/22/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Exhibition.h"

@implementation Exhibition


- (instancetype) initWithDictionary:(NSDictionary *)data {
    self = [super initWithDictionary:data];
    if (self) {
        self.authorName = data[@"authorName"];
        self.authorDescription = data[@"authorDescription"];
    }
    return self;
}

@end
