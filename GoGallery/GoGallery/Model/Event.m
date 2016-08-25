//
//  Event.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Event.h"
#import "NSString+DateConvertor.h"

@implementation Event

- (instancetype) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.ID = data[@"_id"];
        self.name = data[@"name"];
        self.about = data[@"about"];
        
        if ([data[@"dateStart"] isKindOfClass:[NSString class]]) {
            self.dateStart = [data[@"dateStart"] date];
        }
        if ([data[@"dateEnd"] isKindOfClass:[NSString class]]) {
            self.dateEnd = [data[@"dateEnd"] date];
        }
    }
    return self;
}

@end
